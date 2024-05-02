search
findRankedDocuments: number similarToQuery: aString collect: collectBlock thenSelect: selectBlock

	| embedding |
	embedding := self getEmbeddingFor: aString.
	^ self findRankedDocuments: number nearEmbedding: embedding collect: collectBlock thenSelect: selectBlock