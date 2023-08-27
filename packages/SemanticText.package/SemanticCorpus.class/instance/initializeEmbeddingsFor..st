embeddings
initializeEmbeddingsFor: someDocuments

	| requestsPerMinute model tokensPerRequest |
	"Update documents in chunks to minimize model overhead. Honor rate limits."
	self flag: #magicNumbers. "We currently rely on the rate limits of the model to maximize embedded documents per time. We currently do not include any safety buffer since token approximations are rounded up. Some providers also indicate rate limits in headers (https://platform.openai.com/docs/guides/rate-limits/rate-limits-in-headers) which could possibly be relevant for us. See also: https://github.com/openai/openai-cookbook/blob/a74a7a7940928d504f6e9f7300ddef7f47e8659d/examples/api_request_parallel_processor.py"
	requestsPerMinute := 1. "adjust at will"
	
	model := self embeddingModel.
	requestsPerMinute := requestsPerMinute clampHigh: model requestsPerMinute.
	tokensPerRequest := model tokensPerMinute / requestsPerMinute.
	
	('Initializing embeddings (approx {1} per minute)...' format: {model pricePerMinute}) semanticDisplayRichProgressFrom: 0 to: someDocuments size during: [:bar |
		
		| nextRequest |
		nextRequest := DateAndTime now.
		someDocuments asArray readStream in: [:fullStream |
			[fullStream atEnd] whileFalse: [
				| chunk chunkTexts chunkTokens nextDocument nextText nextDocumentTokens embeddings |
				chunk := OrderedCollection new.
				chunkTexts := OrderedCollection new.
				chunkTokens := 0.
				[(nextDocument := fullStream peek) notNil and:
					[nextText := fullStream peek text.
					nextDocumentTokens := model countTokensIn: nextText.
					(chunkTokens + nextDocumentTokens <= tokensPerRequest)
						or:
							[chunk isEmpty and:
								[self notify: 'skipping too large document'.
								fullStream next.
								true "continue"]]]]
						whileTrue:
							[chunk addLast: fullStream next.
							chunkTexts addLast: nextText].
				
				((nextRequest - DateAndTime now) clampLow: 0 seconds) wait.
				nextRequest := requestsPerMinute reciprocal minutes fromNow.
				embeddings := model getEmbeddingsForAll: chunkTexts.
				
				chunk with: embeddings do: [:doc :embedding |
					doc embedding: embedding].
				
				bar value: fullStream position]]].