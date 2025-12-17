printing
printOn: aStream

	super printOn: aStream.
	aStream nextPut: $(.
	self probability printOn: aStream showingDecimalPlaces: 2.
	aStream nextPut: $).