private
embeddingConfig: anEmbeddingConfig

	(embeddingConfig isNil or: [embeddingConfig = anEmbeddingConfig]) ifTrue:
		[embeddingConfig := anEmbeddingConfig.
		^ self].
	
	self reinitializeEmbeddingsAround:
		[embeddingConfig := anEmbeddingConfig].