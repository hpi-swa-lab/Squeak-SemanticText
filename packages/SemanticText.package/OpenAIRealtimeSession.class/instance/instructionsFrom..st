private - configuration
instructionsFrom: aConversation

	| instructionMessages message |
	instructionMessages := aConversation messages select: [:ea |
		ea isSystemMessage and: [ea isRealtimeInstructions]].
	instructionMessages ifEmpty: [^ nil].
	instructionMessages size > 1 ifTrue: [self error: 'must not specify multiple realtime instruction messages'].
	message := instructionMessages anyOne.
	
	(self conversation messages indexOf: message) = 1 ifFalse:
		[self error: 'realtime instruction message must be at beginning of conversation'].
	message toolCalls ifNotEmpty: [self error: 'realtime instruction message must not have tool calls'].
	^ message content