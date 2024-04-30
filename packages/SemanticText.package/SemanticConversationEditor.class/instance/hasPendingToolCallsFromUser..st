testing
hasPendingToolCallsFromUser: fromUser

	| editConversation |
	[editConversation := self conversationFromText: self editText hasUserEdited: fromUser.
	editConversation messages atLast: 1 ifPresent: [:message |
		(message role = #user and: [message content isEmptyOrNil] and: [message toolCalls isEmpty])
			ifTrue: [editConversation messages: editConversation messages allButLast]]]
		ifError: [editConversation := self conversation].
	^ editConversation hasPendingToolCalls