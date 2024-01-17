streaming
addChunk: aStringOrNil toolCalls: newToolCallsOrNil tokenProbabilities: newTokenProbabilitiesOrNil

	aStringOrNil ifNotNil:
		[self content: (self basicContent ifNil: ['']) , aStringOrNil].
	
	newToolCallsOrNil ifNotNil:
		[self toolCalls: self toolCalls , newToolCallsOrNil asArray].
	newTokenProbabilitiesOrNil ifNotNil:
		[self tokenProbabilities: (self tokenProbabilities ifNil: [#()]) , newTokenProbabilitiesOrNil].
	
	self triggerEvent: #newChunk with: (aStringOrNil ifNil: ['']).
	self flag: #todo. "notify about new tool calls/token probabilities?"