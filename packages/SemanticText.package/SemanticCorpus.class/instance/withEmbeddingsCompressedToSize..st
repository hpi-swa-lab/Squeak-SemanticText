copying
withEmbeddingsCompressedToSize: newEmbeddingSize

	| copy |
	copy := self copy.
	copy compressEmbeddingsToSize: newEmbeddingSize.
	copy embeddingConfig embeddingSize: newEmbeddingSize.
	^ copy