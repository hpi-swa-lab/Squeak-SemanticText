printing
printOn: aStream

	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self model name;
		nextPut: $).