requests
addMessageToSession: aMessage

	| previous |
	(aMessage isSystemMessage and: [aMessage isRealtimeInstructions]) ifTrue:
		[(self conversation messages indexOf: aMessage) = 1 ifFalse:
			[self error: 'realtime instruction message must be at beginning of conversation'].
		aMessage toolCalls ifNotEmpty: [self error: 'realtime instruction message must not have tool calls'].
		^ self updateSession].
	
	previous := self conversation messages before: aMessage ifAbsent: [nil].
	(previous notNil and: [previous isSystemMessage] and: [previous isRealtimeInstructions]) ifTrue:
		[previous := nil].
	previous ifNotNil:
		[previous hasToolCalls ifTrue: [previous := previous toolCalls last]].
	(aMessage isAssistantMessage and: [aMessage content isNil])
		ifFalse:
			[(self
				sendConversationItemCreate: aMessage
				after: previous) wait.
			previous := aMessage]
		ifTrue:
			[self assert: aMessage hasToolCalls].
	aMessage toolCalls do: [:toolCall |
		(self
			sendConversationItemCreate: toolCall
			after: previous) wait.
		previous := toolCall].