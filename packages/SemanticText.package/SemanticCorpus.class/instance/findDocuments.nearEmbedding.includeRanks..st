search-embeddings
findDocuments: number nearEmbedding: embedding includeRanks: includeRanks

	^ self
		findDocuments: number
		nearEmbedding: embedding
		useClusters: clusters notNil
		includeRanks: includeRanks