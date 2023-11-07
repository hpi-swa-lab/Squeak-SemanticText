initialize-release
initialize

	| model |
	model := self new.
	SemanticText registerEmbeddingModel: model.
	SemanticText defaultEmbeddingModelOrNil ifNil:
		[SemanticText defaultEmbeddingModel: model].