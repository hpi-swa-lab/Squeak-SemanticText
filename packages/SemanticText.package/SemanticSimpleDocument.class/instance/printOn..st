printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPutAll: ' forText: ';
		print: self text.