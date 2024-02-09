private
embeddingModel: aModel

	(embeddingModel isNil or: [embeddingModel = aModel]) ifTrue:
		[embeddingModel := aModel.
		^ self].
	
	self reinitializeEmbeddingsAround:
		[embeddingModel := aModel].