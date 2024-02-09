search
findRankedDocuments: number similarToQuery: aString collect: collectBlock

	| embedding |
	embedding := self embeddingModel getEmbeddingFor: aString config: self embeddingConfig.
	
	^ self findRankedDocuments: number nearEmbedding: embedding collect: collectBlock