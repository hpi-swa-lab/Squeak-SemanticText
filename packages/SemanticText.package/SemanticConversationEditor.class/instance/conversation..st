accessing
conversation: aConversation

	conversation := aConversation.
	
	self voiceAutomaton conversation: self conversation.
	
	self changed: #conversation.