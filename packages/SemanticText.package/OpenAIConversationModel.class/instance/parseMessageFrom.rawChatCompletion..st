private
parseMessageFrom: chatCompletionChoice rawChatCompletion: chatCompletionOrNil

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
	
	chatCompletionChoice logprobs ifNotNil: [:logprobs |
		| tokenProbabilities |
		tokenProbabilities := self parseTokenProbabilitiesFrom: logprobs.
		message tokenProbabilities: tokenProbabilities].
	
	^ message