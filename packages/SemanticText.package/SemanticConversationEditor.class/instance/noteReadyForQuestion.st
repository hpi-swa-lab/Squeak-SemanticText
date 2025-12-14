updating - conversation
noteReadyForQuestion

	(self shouldListen and: [self shouldSpeak not]) ifTrue:
		[self voiceAutomaton startListening].
	
	self addUserMessage.