embeddings
embeddingSize

	^ self effectiveEmbeddingConfig embeddingSize ifNil:
		[self embeddingModel maxEmbeddingSize]