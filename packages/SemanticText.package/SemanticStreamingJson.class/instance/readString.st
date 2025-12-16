private
readString

	| outStream result |
	self resetStringBufferStream.
	publishBlock ifNotNil:
		[outStream := publishBlock value: SemanticBufferedChannel newForString].
	[ [
		currentCharacter := stream next ifNil: [self incomplete: 'Unexpected end of string' ].
		currentCharacter == $" ifTrue: [ 
			outStream ifNotNil: [outStream close].
			result := stringBufferStream contents.
			currentCharacter := stream next.
			^ result].
		currentCharacter == $\
			ifTrue: [ 
				stringBufferStream nextPut: (self interpretStringEscape: (stream next ifNil: [
					self incomplete: 'Unexpected end of string' ])) ]
			ifFalse: [ stringBufferStream nextPut: currentCharacter ].
		outStream ifNotNil: [outStream nextPut: stringBufferStream peekLast] ] repeat ]
			ifCurtailed: [ outStream ifNotNil: [result ifNil: [outStream triggerEvent: #cancelled]] ]