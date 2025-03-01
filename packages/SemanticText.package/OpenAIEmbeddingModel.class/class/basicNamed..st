support
basicNamed: aString

	^ SemanticText registeredEmbeddingModels detect: [:model | model name = aString]