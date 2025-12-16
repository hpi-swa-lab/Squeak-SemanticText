private - conversation
editMessagesFromServer: aBlock

	self unwatchConversation.
	^ aBlock ensure:
		[self watchConversation]