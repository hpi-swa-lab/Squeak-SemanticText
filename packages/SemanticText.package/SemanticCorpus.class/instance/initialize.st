initialize-release
initialize

	super initialize.
	
	documents := Set new.
	self embeddingModel: SemanticText defaultEmbeddingModel.