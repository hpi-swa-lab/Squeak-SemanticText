search-embeddings
findDocuments: number nearEmbedding: embedding useClusters: useClusters

	^ useClusters
		ifTrue: [self findClusteredDocuments: number nearEmbedding: embedding]
		ifFalse: [self findAllDocuments: number nearEmbedding: embedding]