fileIn/Out
readFromCallString: aStringOrStream

	| toolName argumentName |
	aStringOrStream isStream ifFalse: [^ self readFromCallString: aStringOrStream readStream].
	
	toolName := (aStringOrStream upToAnyOf: '(' do: [:c |]) withBlanksTrimmed.
	self tool: toolName.
	[aStringOrStream skipSeparators.
	(argumentName := (aStringOrStream upToAnyOf: '=)' do: [:c |]) withBlanksTrimmed) isEmpty] whileFalse:
		[| argumentValue |
		aStringOrStream skipSeparators.
		argumentValue := Json new dictionaryClass: OrderedJsonObject; readFrom: aStringOrStream.
		self arguments at: argumentName put: argumentValue.
		self assert: ((aStringOrStream upToAnyOf: ',)' do: [:c |]) withBlanksTrimmed) isEmpty].