fileIn/Out
writeHeaderOn: aStream

	aStream binary nextPut: self text size.
	aStream ascii nextPutAll: self text.