fileIn/Out
readArgumentsFromCallString: aStream

	| argumentsString |
	aStream peek = ${ ifFalse: [^ super readArgumentsFromCallString: aStream].
	
	argumentsString := aStream upToEnd.
	self assert: argumentsString last = $).
	argumentsString := argumentsString allButLast.
	
	self parseArguments: argumentsString.
	argumentsString
		ifEmpty:
			[self streamedArgumentsString: argumentsString]
		ifNotEmpty:
			[super arguments ifNotNil:
				[complete := true]].