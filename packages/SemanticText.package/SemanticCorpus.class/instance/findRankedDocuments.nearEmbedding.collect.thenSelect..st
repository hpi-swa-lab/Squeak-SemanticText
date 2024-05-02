search-embeddings
findRankedDocuments: number nearEmbedding: embedding collect: collectBlock thenSelect: selectBlock

	^ self
		findDocuments: number
		nearEmbedding: embedding
		collect: collectBlock
		thenSelect: selectBlock
		includeRanks: true