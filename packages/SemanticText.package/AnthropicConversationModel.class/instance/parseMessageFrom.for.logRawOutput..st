private - requests
parseMessageFrom: chatCompletionChoice for: aConversation logRawOutput: logRawOutput

	| messageResult message toolUseBlocks |
	messageResult := chatCompletionChoice.
	message := SemanticMessage
		conversation: aConversation
		role: messageResult role
		content: (messageResult content first type = 'text' ifTrue: [messageResult content first text] ifFalse: [messageResult content]).
	
	logRawOutput ifTrue:
		[message rawOutput:
			(JsonObject new
				chatCompletionChoice: chatCompletionChoice;
				yourself)].
	
	toolUseBlocks := messageResult content select: [:contentBlock | contentBlock type = 'tool_use'].
	toolUseBlocks size > 0 ifTrue: [
		message toolCalls:
			(self parseToolCallsFrom: toolUseBlocks toolSpec: aConversation activeToolSpec)].
	
	chatCompletionChoice logprobs ifNotNil: [:logprobs |
		message tokenProbabilities:
			(self parseTokenProbabilitiesFrom: logprobs)].
	
	^ message