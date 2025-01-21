private - tokens
printFunctionCallArguments: arguments on: aStream

	aStream nextPut: ${; cr.
	arguments keysAndValuesDo: [:argumentName :argumentValue |
		aStream
			print: argumentName;
			nextPut: $:;
			print: argumentValue;
			nextPut: $,;
			cr].
	aStream nextPut: $}; cr.