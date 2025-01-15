private - requests
parseStreamedChunk: chunk toolSpec: aToolSpecOrNil addTo: aStreamingMessage

	| chunkText chunkToolCalls |
	
	chunk type caseOf: {
		['content_block_delta'] -> [
			chunk delta type caseOf: {
				['text_delta'] -> [chunkText := chunk delta text].
				['input_json_delta'] -> [chunkToolCalls := self parseStreamedToolCallChunksFrom: chunk delta partial_json
					toolSpec: aToolSpecOrNil
					message: aStreamingMessage]
			} otherwise: [:deltaType | self error: 'got unknown content_block_delta type: ' , deltaType].
		]
	} otherwise: [:type | self error: 'got unknown chunk type: ' , type].
	
	aStreamingMessage rawOutput ifNotNil: [:rawOutput |
		rawOutput messageChunks ifNotNil: [:rawChunks |
			rawChunks addLast: chunk]].
	
	self flag: #todo.
	"chunkToolCalls := chatCompletionChoice delta tool_calls ifNotNil: [:toolCalls |
		self parseStreamedToolCallChunksFrom: toolCalls toolSpec: aToolSpecOrNil message: aStreamingMessage]."
	
	(chunkText isEmptyOrNil and: [chunkToolCalls isNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText toolCalls: chunkToolCalls tokenProbabilities: nil].