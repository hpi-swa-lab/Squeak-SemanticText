accessing
voiceName: name

	self updateSpeechSynthesisConfig: [:config |
		config voice: name].