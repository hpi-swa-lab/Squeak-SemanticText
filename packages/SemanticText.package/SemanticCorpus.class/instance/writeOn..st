fileIn/Out
writeOn: aStream

	aStream nextPutAll: self species name; cr.
	self writeHeaderOn: aStream.
	self writeDocumentsOn: aStream.