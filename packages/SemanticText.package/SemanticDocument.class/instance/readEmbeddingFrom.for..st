fileIn/Out
readEmbeddingFrom: aStream for: aCorpus

	aStream binary.
	embedding := Float32Array new: aCorpus embeddingSize.
	aStream nextInto: embedding.