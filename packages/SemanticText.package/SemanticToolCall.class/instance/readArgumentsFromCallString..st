fileIn/Out
readArgumentsFromCallString: aStringOrStream

	| argumentName |
	[(argumentName := (aStringOrStream upToAnyOf: '=)' do: [:c |]) withBlanksTrimmed) isEmpty] whileFalse:
		[| argumentValue |
		aStringOrStream skipSeparators.
		argumentValue := Json new dictionaryClass: OrderedJsonObject; readFrom: aStringOrStream.
		self arguments at: argumentName put: argumentValue.
		self assert: ((aStringOrStream upToAnyOf: ',)' do: [:c |]) withBlanksTrimmed) isEmpty.
		aStringOrStream skipSeparators].