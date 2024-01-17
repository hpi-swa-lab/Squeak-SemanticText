accessing
toolName

	self tool isString ifTrue: [^ self tool].
	
	^ (self tool ifNil: [^ nil]) name