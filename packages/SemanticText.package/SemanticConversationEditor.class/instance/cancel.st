actions
cancel

	self canCancel ifTrue: [self conversation cancel].
	
	self voiceAutomaton stopSpeaking.