streaming
addChunk: aStringOrNil toolCalls: newToolCallsOrNil tokenProbabilities: newTokenProbabilitiesOrNil

	| newText |
	aStringOrNil ifNotNil:
		[newText := aStringOrNil.
		newTokenProbabilitiesOrNil ifNotNil:
			[newText := SemanticTokenProbabilityTag
				annotateText: newText
				withProbabilities: newTokenProbabilitiesOrNil]].
	
	newText ifNotNil:
		[self content: (self basicContent ifNil: ['']) asText , newText].
	
	newToolCallsOrNil ifNotNil:
		[self toolCalls: self toolCalls , newToolCallsOrNil asArray.
		newToolCallsOrNil do: [:toolCall |
			self triggerEvent: #newToolCall with: toolCall]].
	newTokenProbabilitiesOrNil ifNotNil:
		[self tokenProbabilities: (self tokenProbabilities ifNil: [#()]) , newTokenProbabilitiesOrNil].
	
	self triggerEvent: #newChunk with: (newText ifNil: ['']).
	self flag: #todo. "notify about new tool calls/token probabilities?"