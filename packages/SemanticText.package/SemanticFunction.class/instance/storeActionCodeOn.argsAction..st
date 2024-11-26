as yet unclassified
storeActionCodeOn: aStream argsAction: argsAction

	aStream
		nextPutAll: #argsAction:;
		space.
	
	argsAction ifNotNil:
		[argsAction method homeMethod == (self class >> #argsAction:) ifTrue:
			[aStream print: (argsAction at: 1). "symbol"
			^ self].
		aStream nextPutAll:
			(argsAction isBlock
				ifTrue: [argsAction decompile decompileString]
				ifFalse: [argsAction printString]).
		^ self].
	
	aStream nextPut: $[.
	self parameters
		do: [:parameter |
			aStream
				nextPut: $:;
				nextPutAll: parameter name;
				space];
		ifNotEmpty:
			[aStream nextPut: $|; space].
	aStream
		nextPutAll: 'self halt';
		nextPut: $].
	^ self