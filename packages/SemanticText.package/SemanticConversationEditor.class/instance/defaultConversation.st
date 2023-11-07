initialize-release
defaultConversation

	| defaultConversation |
	defaultConversation := SemanticConversation newStreaming.
	
	self shouldShowWelcomeMessage ifTrue:
		[self addWelcomeMessageTo: defaultConversation].
	
	^ defaultConversation