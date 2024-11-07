conversation
initializeConversation: aConversation

	super initializeConversation: aConversation.
	aConversation addSystemMessage: 'You are a Squeak/Smalltalk assistant.'.
	aConversation addAssistantMessage: 'Hi, how can I help you?'.