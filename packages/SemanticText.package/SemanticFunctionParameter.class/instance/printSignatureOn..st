printing
printSignatureOn: aStream

	aStream nextPutAll: self name.
	self required ifFalse:
		[aStream nextPut: $?].
	
	aStream nextPutAll: ': '.
	self type isString
		ifTrue: [aStream nextPutAll: self type]
		ifFalse: [self type jsonWriteOn: aStream].
	
	self description ifNotNil:
		[aStream
			space;
			nextPut: $";
			nextPutAll: self description;
			nextPut: $"].