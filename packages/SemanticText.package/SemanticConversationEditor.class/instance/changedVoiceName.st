updating
changedVoiceName

	self voiceAutomaton shouldSynthesize ifFalse:
		[self conversation config audioVoice: (self shouldSpeak ifTrue: [self voiceName])].