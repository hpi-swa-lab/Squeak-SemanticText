requests
removeMessageFromSession: aMessage

	(aMessage isSystemMessage and: [aMessage isRealtimeInstructions]) ifTrue:
		[^ self updateSession].
	
	(aMessage isAssistantMessage and: [aMessage content isNil])
		ifFalse:
			[(self sendConversationItemDelete: aMessage) wait]
		ifTrue:
			[self assert: aMessage hasToolCalls.
			(Promise all:
				(aMessage toolCalls collect: [:toolCall |
					self sendConversationItemDelete: toolCall])) wait].