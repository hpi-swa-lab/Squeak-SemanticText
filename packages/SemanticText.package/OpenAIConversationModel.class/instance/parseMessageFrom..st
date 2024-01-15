private
parseMessageFrom: chatCompletionChoice

	| messageResult message |
	messageResult := chatCompletionChoice message.
	message := SemanticMessage
		role: messageResult role
		content: messageResult content.
	
	chatCompletionChoice logprobs ifNotNil: [:logprobs |
		| tokenProbabilities |
		tokenProbabilities := self parseTokenProbabilitiesFrom: logprobs.
		message tokenProbabilities: tokenProbabilities].
	
	^ message