private
parseMessageFrom: chatCompletionChoice toolSpec: aToolSpecOrNil rawChatCompletion: chatCompletionOrNil

	| messageResult message |
	messageResult := chatCompletionChoice message.
	message := SemanticMessage
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
			(self parseToolCallsFrom: toolCalls toolSpec: aToolSpecOrNil)].
	
	chatCompletionChoice logprobs ifNotNil: [:logprobs |
		message tokenProbabilities:
			(self parseTokenProbabilitiesFrom: logprobs)].
	
	^ message