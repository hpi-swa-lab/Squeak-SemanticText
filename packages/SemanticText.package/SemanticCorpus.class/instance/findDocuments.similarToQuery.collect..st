search
findDocuments: number similarToQuery: aString collect: collectBlock

	| embedding |
	embedding := self embeddingModel getEmbeddingFor: aString config: self embeddingConfig.
	
	^ self findDocuments: number nearEmbedding: embedding collect: collectBlock