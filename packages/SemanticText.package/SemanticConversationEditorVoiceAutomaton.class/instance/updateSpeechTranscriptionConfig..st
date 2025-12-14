accessing
updateSpeechTranscriptionConfig: aBlock

	aBlock value: self assureSpeechTranscriptionConfig.
	self changed: #speechTranscriptionConfig.