private - tokens
printFunction: aFunction on: aStream

	aFunction description isEmptyOrNil ifFalse:
		[aStream
			nextPutAll: '// ';
			nextPutAll: aFunction description;
			cr].
	
	aFunction name isEmptyOrNil ifFalse:
		[aStream
			nextPutAll: 'type ';
			nextPutAll: aFunction name;
			nextPutAll: ' = (_: {';
			cr].
	
	self
		printFunctionParameterSchema: aFunction asOpenAIObject function parameters
		on: aStream.
	
	aStream
		nextPutAll: '}) => any;';
		cr.