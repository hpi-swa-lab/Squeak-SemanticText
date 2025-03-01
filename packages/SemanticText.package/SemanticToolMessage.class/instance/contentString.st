accessing
contentString

	self object ifNil: [^ super basicContent ifNil: ['']].
	
	(self object isString or: [self object isText]) ifTrue: [^ self object asString].
	
	^ [self object asJsonString] onDNU: #jsonWriteOn: do: [self object printString]