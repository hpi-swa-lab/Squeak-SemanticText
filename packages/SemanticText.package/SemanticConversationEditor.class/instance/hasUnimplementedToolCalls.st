testing
hasUnimplementedToolCalls

	| editConversation |
	[editConversation := self conversationFromText: self editText hasUserEdited: false.
	editConversation messages atLast: 1 ifPresent: [:message |
		(message role = #user and: [message content isEmptyOrNil] and: [message toolCalls isEmpty])
			ifTrue: [editConversation messages: editConversation messages allButLast]]]
		ifError: [editConversation := self conversation].
	^ editConversation lastMessage toolCalls anySatisfy: [:toolCall | toolCall tool action isNil]