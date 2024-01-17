printing
printCallArgumentsOn: aStream

	self arguments isString ifTrue:
		[aStream nextPutAll: self arguments.
		^ self].
	
	self arguments associations
		do: [:argument |
			aStream
				nextPutAll: argument key;
				nextPut: $=.
			argument value jsonWriteOn: aStream]
		separatedBy:
			[aStream nextPutAll: ', '].