private - requests
parseMessageFrom: chatCompletionChoice for: aConversation rawChatCompletion: chatCompletionOrNil

	| messageResult message |
	messageResult := chatCompletionChoice message.
	message := SemanticMessage
		conversation: chatCompletionChoice
		role: messageResult role
		content: messageResult content.
	
	chatCompletionOrNil ifNotNil:
		[message rawOutput:
			(JsonObject new
				chatCompletion: chatCompletionOrNil;
				chatCompletionChoice: chatCompletionChoice;
				yourself)].
	
	messageResult tool_calls ifNotNil: [:toolCalls |
		message toolCalls:
			(self parseToolCallsFrom: toolCalls toolSpec: aConversation activeToolSpec)].
	
	chatCompletionChoice logprobs ifNotNil: [:logprobs |
		message tokenProbabilities:
			(self parseTokenProbabilitiesFrom: logprobs)].
	
	^ message