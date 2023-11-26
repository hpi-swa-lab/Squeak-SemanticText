initialize-release
initialize

	SemanticText registeredConversationModels
		detect: [:ea | ea isMemberOf: self]
		ifNone: [SemanticText registerEmbeddingModel: self new].