fileIn/Out
readFrom: aStream

	self readHeaderFrom: aStream.
	self readDocumentsFrom: aStream.