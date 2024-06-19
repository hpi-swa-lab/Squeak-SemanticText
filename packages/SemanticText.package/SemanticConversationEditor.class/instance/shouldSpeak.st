testing
shouldSpeak

	^ self voiceModeEnabled and: [self voiceAutomaton shouldSpeak]