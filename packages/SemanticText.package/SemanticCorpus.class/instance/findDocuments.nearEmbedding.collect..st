search-embeddings
findDocuments: number nearEmbedding: embedding collect: collectBlock

	^ self
		findDocuments: number
		nearEmbedding: embedding
		collect: collectBlock
		thenSelect: nil