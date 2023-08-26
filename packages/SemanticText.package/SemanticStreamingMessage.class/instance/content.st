accessing
content

	self isComplete ifTrue: [^ super content].
	
	^ super content , self cursorText