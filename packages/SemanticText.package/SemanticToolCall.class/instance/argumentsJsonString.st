converting
argumentsJsonString

	self arguments isString ifTrue: [^ self arguments].
	
	^ self arguments asJsonString