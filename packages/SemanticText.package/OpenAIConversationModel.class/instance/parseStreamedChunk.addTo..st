private
parseStreamedChunk: chatCompletionChunk addTo: aStreamingMessage

	| chunkText chunkTokenProbabilities |
	chunkText := chatCompletionChunk delta content.
	
	chunkTokenProbabilities := chatCompletionChunk logprobs ifNotNil: [:logprobs |
		self parseTokenProbabilitiesFrom: logprobs].
	
	(chunkText isEmptyOrNil and: [chunkTokenProbabilities isEmptyOrNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText tokenProbabilities: chunkTokenProbabilities].