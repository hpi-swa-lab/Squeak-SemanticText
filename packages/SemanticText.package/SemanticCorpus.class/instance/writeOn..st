fileIn/Out
writeOn: aStream

	self writeHeaderOn: aStream.
	self writeDocumentsOn: aStream.