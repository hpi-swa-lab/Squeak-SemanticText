printing
printRoleOn: aStream

	self isComplete ifFalse:
		[aStream nextPut: $*].
	super printRoleOn: aStream.