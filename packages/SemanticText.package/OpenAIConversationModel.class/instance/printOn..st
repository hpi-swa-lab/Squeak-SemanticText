printing
printOn: aStream

	super printOn: aStream.
	
	self resolvedName = self name ifFalse:
		[aStream
			nextPutAll: ' (';
			nextPutAll: self resolvedName;
			nextPut: $)].