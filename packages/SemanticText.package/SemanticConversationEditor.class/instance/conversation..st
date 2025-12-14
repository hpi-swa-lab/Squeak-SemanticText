accessing
conversation: aConversation

	conversation ifNotNil:
		[conversation
			removeActionsWithReceiver: self;
			removeActionsWithReceiver: self voiceAutomaton].
	
	conversation := aConversation.
	
	self voiceAutomaton
		conversation: self conversation;
		speechTranscriptionConfig: self conversation effectiveConfig speechTranscriptionConfigOrNil;
		speechSynthesisConfig: self conversation effectiveConfig speechSynthesisConfigOrNil.
	self changed: #conversation.
	
	self updateStreamingConversation.