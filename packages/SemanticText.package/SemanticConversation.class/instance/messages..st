accessing
messages: anOrderedCollection

	| oldMessages |
	((self hasActionForEvent: #newMessage) or: [self hasActionForEvent: #removeMessage]) ifTrue:
		[oldMessages := messages].
	
	messages := anOrderedCollection.
	messages do: [:message |
		message conversation: self].
	
	oldMessages ifNotNil:
		[self flag: #todo. "detect edited messages here and readd them."
		(oldMessages copyWithoutAll: messages) do: [:oldMessage |
			self triggerEvent: #removedMessage with: oldMessage].
		(messages copyWithoutAll: oldMessages) do: [:newMessage |
			self triggerEvent: #newMessage with: newMessage]].