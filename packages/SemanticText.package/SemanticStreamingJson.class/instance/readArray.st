private
readArray

	| initialPosition outStream result |
	currentCharacter := stream next.
	self skipWhitespace.
	currentCharacter == $] ifTrue: [
		currentCharacter := stream next.
		^#() ].
	initialPosition := self arrayBufferStream position.
	publishBlock ifNotNil:
		[outStream := publishBlock value: SemanticBufferedChannel new].
	[ [
		arrayBufferStream nextPut: self readAny.
		outStream nextPut: arrayBufferStream peekLast.
		self skipWhitespace.
		currentCharacter == $] ifTrue: [ 
			outStream ifNotNil: [outStream close].
			result := arrayBufferStream originalContents copyFrom: initialPosition + 1 to: arrayBufferStream position.
			arrayBufferStream position: initialPosition.
			currentCharacter := stream next.
			^result ].
		currentCharacter == $, ifFalse: [ self error: 'Unexpected character: ', currentCharacter asString ].
		currentCharacter := stream next ] repeat ]
			ifCurtailed: [ outStream ifNotNil: [result ifNil: [outStream triggerEvent: #cancelled]] ].