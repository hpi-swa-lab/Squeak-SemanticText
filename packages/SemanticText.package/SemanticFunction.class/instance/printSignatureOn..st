printing
printSignatureOn: aStream

	aStream nextPutAll: self name.
	self description ifNotNil:
		[aStream
			space;
			nextPut: $";
			nextPutAll: (self description copyWithRegex: '(?=[\\"])' matchesReplacedWith: '\'); "escape"
			nextPut: $";
			space].
	
	aStream nextPut: $(.
	self parameters
		do: [:parameter | parameter printSignatureOn: aStream]
		separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $).