fileIn/Out
readFromCallString: aStringOrStream

	| toolName argumentName |
	aStringOrStream isStream ifFalse:
		[| stream toolCall |
		stream := aStringOrStream readStream.
		toolCall := self readFromCallString: stream.
		self assert: stream atEnd.
		^ toolCall].
	
	toolName := (aStringOrStream upToAnyOf: '(' do: [:c |]) withBlanksTrimmed.
	self tool: toolName.
	[aStringOrStream skipSeparators.
	(argumentName := (aStringOrStream upToAnyOf: '=)' do: [:c |]) withBlanksTrimmed) isEmpty] whileFalse:
		[| argumentValue |
		aStringOrStream skipSeparators.
		argumentValue := Json new dictionaryClass: OrderedJsonObject; readFrom: aStringOrStream.
		self arguments at: argumentName put: argumentValue.
		self assert: ((aStringOrStream upToAnyOf: ',)' do: [:c |]) withBlanksTrimmed) isEmpty].