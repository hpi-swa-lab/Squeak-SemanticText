updating
changedSpeechTranscriptionModel

	self voiceAutomaton shouldTranscribe ifFalse:
		[self conversation updateConfig: [:config |
			config speechTranscriptionModelName: self speechTranscriptionModel name]].