conversation
makeNewConversation

	| conversation |
	conversation := SemanticConversation newStreaming.
	self initializeConversation: conversation.
	^ conversation