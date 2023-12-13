search-embeddings
findDocuments: number nearEmbedding: embedding collect: collectBlock thenSelect: selectBlock

	^ self
		findDocuments: number
		nearEmbedding: embedding
		collect: collectBlock
		thenSelect: selectBlock
		includeRanks: false