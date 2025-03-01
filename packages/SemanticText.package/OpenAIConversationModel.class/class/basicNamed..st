support
basicNamed: aString

	^ SemanticText registeredConversationModels detect: [:model | model name = aString]