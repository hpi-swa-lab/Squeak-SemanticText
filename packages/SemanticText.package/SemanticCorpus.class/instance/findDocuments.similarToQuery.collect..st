search
findDocuments: number similarToQuery: aString collect: collectBlock

	| embedding |
	embedding := self getEmbeddingFor: aString.
	^ self findDocuments: number nearEmbedding: embedding collect: collectBlock