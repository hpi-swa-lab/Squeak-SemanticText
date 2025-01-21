private - tokens
printFunctionParameterSchema: schema on: aStream indent: indent

	| required |
	required := schema required.
	schema properties keysAndValuesDo: [:key :value |
		value description isEmptyOrNil ifFalse:
			[aStream
				space: indent;
				nextPutAll: '// ';
				nextPutAll: value description;
				cr].
		aStream
			space: indent;
			nextPutAll: key.
		(required includes: key) ifFalse:
			[aStream nextPut: $?].
		aStream nextPutAll: ': '.
		self printFunctionParameterType: value on: aStream indent: indent.
		aStream
			nextPut: $,;
			cr].