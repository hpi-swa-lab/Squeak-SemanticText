accessing
conversation: aConversation

	conversation := aConversation.
	
	self voiceAutomaton
		conversation: self conversation;
		speechTranscriptionConfig: self conversation effectiveConfig speechTranscriptionConfigOrNil;
		speechSynthesisConfig: self conversation effectiveConfig speechSynthesisConfigOrNil.
	self changed: #conversation.