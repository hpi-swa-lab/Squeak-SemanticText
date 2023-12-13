search-embeddings
findDocuments: number nearEmbedding: embedding useClusters: useClusters

	^ self
		findDocuments: number
		nearEmbedding: embedding
		useClusters: useClusters
		includeRanks: false