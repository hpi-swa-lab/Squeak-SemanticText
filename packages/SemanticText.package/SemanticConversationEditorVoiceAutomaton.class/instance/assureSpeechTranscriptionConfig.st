accessing
assureSpeechTranscriptionConfig

	^ self basicSpeechTranscriptionConfig ifNil:
		[self speechTranscriptionConfig: self speechTranscriptionConfig.
		self basicSpeechTranscriptionConfig]