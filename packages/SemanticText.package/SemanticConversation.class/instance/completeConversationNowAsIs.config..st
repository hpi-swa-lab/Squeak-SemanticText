completing
completeConversationNowAsIs: aBoolean config: aConfigOrNil

	(self supportsOnlyRealtimeSession and: [self realtimeSession isNil]) ifTrue:
		[self startRealtimeSession.
		^ [self completeConversationNowAsIs: aBoolean config: aConfigOrNil]
			ensure: [self stopRealtimeSession]].
	
	(SemanticConversationCompletion newFor: self config: aConfigOrNil)
		completeConversationAsIs: aBoolean.