embeddings
compressEmbeddingsToSize: newEmbeddingSize

	| compressedEmbeddings computedDocuments |
	computedDocuments := (self documents select: [:document | document embedding notNil])
		asArray.
	compressedEmbeddings := self embeddingModel
		compressAllEmbeddings: (computedDocuments collect: [:document | document embedding])
		toSize: newEmbeddingSize.
	computedDocuments with: compressedEmbeddings do: [:document :newEmbedding |
		document embedding: newEmbedding].