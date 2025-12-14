completing
completeConversationAsIs: aBoolean

	self recordPendingToolCallsDuring:
		[self ensureAssistantMessageAsIs: aBoolean.
		
		[self resolveNewToolCalls] whileTrue:
			[self nextAssistantMessage]].