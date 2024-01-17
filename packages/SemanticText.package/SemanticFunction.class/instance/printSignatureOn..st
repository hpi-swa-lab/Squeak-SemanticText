printing
printSignatureOn: aStream

	aStream nextPutAll: self name.
	self description ifNotNil:
		[aStream
			space;
			nextPut: $";
			nextPutAll: self description;
			nextPut: $";
			space].
	
	aStream nextPut: $(.
	self parameters
		do: [:parameter | parameter printSignatureOn: aStream]
		separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $).