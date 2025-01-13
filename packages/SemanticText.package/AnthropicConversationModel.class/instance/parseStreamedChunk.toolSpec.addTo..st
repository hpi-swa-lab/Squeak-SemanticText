private - requests
parseStreamedChunk: chatCompletionChoice toolSpec: aToolSpecOrNil addTo: aStreamingMessage

	| chunkText chunkToolCalls chunkTokenProbabilities |
	self flag: #todo.
	chatCompletionChoice type ~= 'content_block_delta' ifTrue: [
		self error: 'unimplemented: did not expect something other than content_block_delta in here'
	].
	chatCompletionChoice delta type = 'text_delta' ifTrue: [
		chunkText := chatCompletionChoice delta text.
	] ifFalse: [
		self error: 'unimplemented: did not expect something other than text_delta for content_block_delta'
	].
	
	aStreamingMessage rawOutput ifNotNil: [:rawOutput |
		rawOutput chatCompletionChunkChoices ifNotNil: [:rawChoices |
			rawChoices addLast: chatCompletionChoice]].
	
	self flag: #todo.
	"chunkToolCalls := chatCompletionChoice delta tool_calls ifNotNil: [:toolCalls |
		self parseStreamedToolCallChunksFrom: toolCalls toolSpec: aToolSpecOrNil message: aStreamingMessage]."
	
	"chunkTokenProbabilities := chatCompletionChoice logprobs ifNotNil: [:logprobs |
		self parseTokenProbabilitiesFrom: logprobs]."
	
	(chunkText isEmptyOrNil and: [chunkToolCalls isNil] and: [chunkTokenProbabilities isEmptyOrNil]) ifFalse:
		[aStreamingMessage addChunk: chunkText toolCalls: chunkToolCalls tokenProbabilities: chunkTokenProbabilities].