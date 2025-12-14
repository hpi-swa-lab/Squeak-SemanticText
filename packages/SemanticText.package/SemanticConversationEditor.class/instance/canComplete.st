testing
canComplete

	| newConversation |
	newConversation := self conversationFromUserText.
	newConversation messages ifEmpty: [^ false].
	^ newConversation lastMessage basicContent isEmptyOrNil not
		or: [newConversation lastMessage hasToolCalls]