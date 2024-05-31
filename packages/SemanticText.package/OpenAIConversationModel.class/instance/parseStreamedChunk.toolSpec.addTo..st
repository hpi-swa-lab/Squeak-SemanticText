private - requests
parseStreamedChunk: chatCompletionChoice toolSpec: aToolSpecOrNil addTo: aStreamingMessage

	| chunkText chunkToolCalls chunkTokenProbabilities |
	chunkText := chatCompletionChoice delta content.
	
	aStreamingMessage rawOutput ifNotNil: [:rawOutput |
		rawOutput chatCompletionChunkChoices ifNotNil: [:rawChoices |
			rawChoices addLast: chatCompletionChoice]].
	
	chunkToolCalls := chatCompletionChoice delta tool_calls ifNotNil: [:toolCalls |
		self parseStreamedToolCallChunksFrom: toolCalls toolSpec: aToolSpecOrNil message: aStreamingMessage].
	
	chunkTokenProbabilities := chatCompletionChoice logprobs ifNotNil: [:logprobs |
		self parseTokenProbabilitiesFrom: logprobs].
	
	(chunkText isEmptyOrNil and: [chunkToolCalls isNil] and: [chunkTokenProbabilities isEmptyOrNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText toolCalls: chunkToolCalls tokenProbabilities: chunkTokenProbabilities].