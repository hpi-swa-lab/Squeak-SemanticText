private
parseStreamedChunk: chatCompletionChoice addTo: aStreamingMessage rawChatCompletionChunk: chatCompletionChunkOrNil

	| chunkText chunkTokenProbabilities |
	chunkText := chatCompletionChoice delta content.
	
	chatCompletionChunkOrNil ifNotNil:
		[aStreamingMessage rawOutput chatCompletionChunks addLast: chatCompletionChunkOrNil.
		aStreamingMessage rawOutput chatCompletionChunkChoices addLast: chatCompletionChoice].
	
	chunkTokenProbabilities := chatCompletionChoice logprobs ifNotNil: [:logprobs |
		self parseTokenProbabilitiesFrom: logprobs].
	
	(chunkText isEmptyOrNil and: [chunkTokenProbabilities isEmptyOrNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText tokenProbabilities: chunkTokenProbabilities].