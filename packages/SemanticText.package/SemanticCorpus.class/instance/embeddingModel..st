private
embeddingModel: aModel

	embeddingModel ifNil:
		[embeddingModel := aModel.
		^ self].
	
	self notify: 'If you change the embedding model, you will need to recompute all embeddings!'.
	embeddingModel := aModel.
	self halt initializeEmbeddings