private
parseMessageFrom: chatCompletionChoice

	| messageResult |
	messageResult := chatCompletionChoice message.
	^ SemanticMessage
		role: messageResult role
		content: messageResult content