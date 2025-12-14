printing
printOn: aStream

	super printOn: aStream.
	self messages printElementsOn: aStream.