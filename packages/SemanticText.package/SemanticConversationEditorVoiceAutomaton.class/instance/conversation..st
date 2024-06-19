accessing
conversation: aConversation

	self flag: #refactor. "We could factor out conversation handling from this class. If we need it!"
	conversation := aConversation.