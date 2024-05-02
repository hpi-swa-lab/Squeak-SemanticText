conversation
initializeConversation: aConversation

	super initializeConversation: aConversation.
	aConversation addSystemMessage: 'You are a calculator.'.
	aConversation addAssistantMessage: 'Hi, what can I calculate for you?'.