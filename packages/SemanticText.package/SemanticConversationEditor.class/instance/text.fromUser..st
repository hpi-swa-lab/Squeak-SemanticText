accessing
text: aText fromUser: fromUser

	| newConversation |
	newConversation := self conversationFromText: aText hasUserEdited: fromUser.
	self conversation
		defaultToolSpec: newConversation defaultToolSpec;
		messages: newConversation messages;
		toolSpecs: newConversation toolSpecs.
	self changed: #text.