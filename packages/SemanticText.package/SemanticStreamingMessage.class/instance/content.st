accessing
content

	self isComplete ifTrue: [^ super content].
	
	^ (super content ifNil: ['']) , self cursorText