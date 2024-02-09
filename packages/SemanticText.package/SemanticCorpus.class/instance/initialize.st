initialize-release
initialize

	super initialize.
	
	documents := Set new.
	self embeddingModel: self defaultEmbeddingModel.
	self embeddingConfig: self defaultEmbeddingConfig.