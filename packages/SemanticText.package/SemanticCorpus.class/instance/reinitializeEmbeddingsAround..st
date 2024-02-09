private
reinitializeEmbeddingsAround: aBlock

	| result |
	(documents notNil and: [documents isEmpty]) ifTrue:
		[^ aBlock value].
	
	self notify: 'If you change the embedding model, you will need to recompute all embeddings!'.
	result := aBlock value.
	self halt initializeEmbeddings.
	
	^ result