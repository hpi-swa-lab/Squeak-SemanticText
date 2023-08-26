private
parseMessageFrom: chatCompletion

	| messageResult |
	messageResult := chatCompletion choices first message.
	^ SemanticMessage
		role: messageResult role
		content: messageResult content