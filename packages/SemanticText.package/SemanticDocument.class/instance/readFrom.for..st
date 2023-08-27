fileIn/Out
readFrom: aStream for: aCorpus

	self readHeaderFrom: aStream for: aCorpus.
	self readEmbeddingFrom: aStream for: aCorpus.