search
findRankedDocuments: number similarToQuery: aString collect: collectBlock

	| embedding |
	embedding := self getEmbeddingFor: aString.
	^ self findRankedDocuments: number nearEmbedding: embedding collect: collectBlock