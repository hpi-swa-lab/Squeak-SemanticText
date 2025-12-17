printing
printCallArgumentsOn: aStream

	self isComplete ifTrue:
		[^ super printCallArgumentsOn: aStream].
	
	self streamedArgumentsString
		ifNotNil: [:string |
			aStream nextPutAll: string]
		ifNil:
			[super printCallArgumentsOn: aStream].
	
	aStream nextPutAll: self cursorText.