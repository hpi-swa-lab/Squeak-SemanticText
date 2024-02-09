initialize-release
initialize

	self defaultModelNames do: [:modelName |
		| model |
		model := self new name: modelName.
		SemanticText registeredEmbeddingModels
			detect: [:ea | ea name = model name]
			ifNone:
				[SemanticText registerEmbeddingModel: model.
				SemanticText defaultEmbeddingModelOrNil ifNil:
					[SemanticText defaultEmbeddingModel: model]]].