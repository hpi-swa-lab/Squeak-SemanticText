initialize-release
initialize

	| model |
	model := self new.
	SemanticText registerEmbeddingModel: model.
	(SemanticText defaultModelOrNilFor: #embedding) ifNil:
		[SemanticText defaultEmbeddingModel: model].