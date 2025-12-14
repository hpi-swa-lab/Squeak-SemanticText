updating
changedSpeechTranscriptionConfig

	self voiceAutomaton shouldTranscribe ifFalse:
		[self conversation updateConfig: [:config |
			config speechTranscriptionConfig: self speechTranscriptionConfig]].