initialize-release
initialize

	SemanticText registeredConversationModels
		detect: [:ea | ea isMemberOf: self]
		ifNone: [SemanticText registerConversationModel: self new].