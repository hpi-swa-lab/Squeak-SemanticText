accessing
at: aString put: anObject

	| index |
	aString isString ifFalse: [ self error: 'String expected' ].
	index := self scanForNonBlocking: aString.
	(self array at: index)
		ifNil: [ self atNewIndex: index put: (self associationClass key: aString value: anObject) ]
		ifNotNil: [ :association | association value: anObject ].
	^self