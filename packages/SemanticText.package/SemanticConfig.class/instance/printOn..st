printing
printOn: aStream

	super printOn: aStream.
	self arguments printElementsOn: aStream.