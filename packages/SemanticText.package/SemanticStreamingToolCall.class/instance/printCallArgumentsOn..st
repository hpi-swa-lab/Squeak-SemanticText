printing
printCallArgumentsOn: aStream

	super printCallArgumentsOn: aStream.
	
	self isComplete ifFalse:
		[aStream nextPutAll: self cursorText].