requests
removeMessageFromSession: aMessage

	(aMessage isSystemMessage and: [aMessage isRealtimeInstructions]) ifTrue:
		[^ self updateSession].
	
	(aMessage isAssistantMessage and: [aMessage content isNil])
		ifFalse:
			[aMessage propertyValueAt: #provisionalMessageAdded ifPresent: [:promise |
				promise wait].
			(self sendConversationItemDelete: aMessage) wait]
		ifTrue:
			[self assert: aMessage hasToolCalls.
			aMessage toolCalls do: [:toolCall |
				toolCall propertyValueAt: #provisionalMessageAdded ifPresent: [:promise |
					promise wait]].
			(Promise all:
				(aMessage toolCalls collect: [:toolCall |
					self sendConversationItemDelete: toolCall])) wait].