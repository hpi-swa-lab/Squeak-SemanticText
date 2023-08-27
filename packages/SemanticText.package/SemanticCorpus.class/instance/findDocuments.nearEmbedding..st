search-embeddings
findDocuments: number nearEmbedding: embedding

	^ self
		findDocuments: number
		nearEmbedding: embedding
		useClusters: clusters notNil