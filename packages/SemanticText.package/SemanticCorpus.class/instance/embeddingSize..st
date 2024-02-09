private
embeddingSize: anInteger

	self embeddingSize = anInteger ifTrue:
		[^ self].
	
	self reinitializeEmbeddingsAround:
		[self embeddingConfig embeddingSize: anInteger].