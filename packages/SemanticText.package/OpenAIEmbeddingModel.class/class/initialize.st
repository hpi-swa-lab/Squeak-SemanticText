initialize-release
initialize

	| model |
	model := self new.
	SemanticText registeredEmbeddingModels
		detect: [:ea | ea name = model name]
		ifNone:
			[SemanticText registerEmbeddingModel: model.
			SemanticText defaultEmbeddingModelOrNil ifNil:
				[SemanticText defaultEmbeddingModel: model]].