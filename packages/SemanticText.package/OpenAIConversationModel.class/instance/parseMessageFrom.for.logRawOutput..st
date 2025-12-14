private - requests
parseMessageFrom: chatCompletionChoice for: aConversation logRawOutput: logRawOutput

	| messageResult message |
	messageResult := chatCompletionChoice message.
	message := SemanticMessage
		conversation: aConversation
		role: messageResult role
		content: messageResult content.
	
	logRawOutput ifTrue:
		[message rawOutput:
			(JsonObject new
				chatCompletionChoice: chatCompletionChoice;
				yourself)].
	
	chatCompletionChoice logprobs ifNotNil: [:logprobs |
		message tokenProbabilities:
			(self parseTokenProbabilitiesFrom: logprobs content).
		message content:
			(SemanticTokenProbabilityTag
				annotateText: message content
				withProbabilities: message tokenProbabilities)].
	
	messageResult audio ifNotNil: [:audio |
		self parseAudioFrom: audio into: message].
	
	messageResult tool_calls ifNotNil: [:toolCalls |
		message toolCalls:
			(self parseToolCallsFrom: toolCalls toolSpec: aConversation activeToolSpec)].
	
	^ message