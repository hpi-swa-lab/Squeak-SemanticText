fileIn/Out
readMaybeStreamingFromCallString: aStringOrStream

	| toolName |
	aStringOrStream isStream ifFalse:
		[| stream toolCall |
		stream := aStringOrStream readStream.
		toolCall := self readMaybeStreamingFromCallString: stream.
		self assert: stream atEnd.
		^ toolCall].
	
	toolName := (aStringOrStream upToAnyOf: '(' do: [:c |]) withBlanksTrimmed.
	self tool: toolName.
	
	aStringOrStream skipSeparators.
	aStringOrStream peek = ${ ifTrue:
		[self
			becomeForward: (self as: SemanticStreamingToolCall);
			initializeStreaming].
	
	self readArgumentsFromCallString: aStringOrStream.