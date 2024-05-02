conversation
initializeConversation: aConversation
	"Hook for subclasses, e.g., to add custom prompts through #addSystemMessage:."

	self addPragmaFunctionsTo: aConversation.