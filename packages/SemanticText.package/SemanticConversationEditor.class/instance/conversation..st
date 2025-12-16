accessing
conversation: aConversation

	conversation ifNotNil:
		[conversation realtimeSession ifNotNil: [self stopRealtimeSession].
		conversation
			removeActionsWithReceiver: self;
			removeActionsWithReceiver: self voiceAutomaton].
	
	conversation := aConversation.
	
	self conversation
		when: #streamingStarted send: #updateStreamingConversation to: self;
		when: #responseCancelled send: #stopSpeaking to: self voiceAutomaton.
	self voiceAutomaton
		conversation: self conversation;
		speechTranscriptionConfig: self conversation effectiveConfig speechTranscriptionConfigOrNil;
		speechSynthesisConfig: self conversation effectiveConfig speechSynthesisConfigOrNil.
	self changed: #conversation.
	
	self updateStreamingConversation.