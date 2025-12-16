fileIn/Out
readFromCallString: aStringOrStream

	| toolName |
	aStringOrStream isStream ifFalse:
		[| stream toolCall |
		stream := aStringOrStream readStream.
		toolCall := self readFromCallString: stream.
		self assert: stream atEnd.
		^ toolCall].
	
	toolName := (aStringOrStream upToAnyOf: '(' do: [:c |]) withBlanksTrimmed.
	self tool: toolName.
	
	aStringOrStream skipSeparators.
	self readArgumentsFromCallString: aStringOrStream.