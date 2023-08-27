fileIn/Out
readHeaderFrom: aStream for: aCorpus

	self readObjectFrom: aStream for: aCorpus.
	self readPositionFrom: aStream.