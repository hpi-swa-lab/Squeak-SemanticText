printing
printRoleOn: aStream

	super printRoleOn: aStream.
	aStream
		nextPut: $:;
		nextPutAll: self toolCall toolName.