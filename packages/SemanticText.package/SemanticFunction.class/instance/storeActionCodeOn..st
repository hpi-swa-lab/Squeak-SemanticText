as yet unclassified
storeActionCodeOn: aStream

	self action ifNil:
		[^ self storeActionCodeOn: aStream argsAction: nil].
	
	self action method homeMethod == (self class >> #argsAction:) ifTrue:
		[^ self storeActionCodeOn: aStream argsAction: (self action at: 1)].
	
	aStream
		nextPutAll: #action:;
		space.
	aStream nextPutAll:
		(self action isBlock
			ifTrue: [self action decompile decompileString]
			ifFalse: [self action printString]).