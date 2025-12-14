accessing
assureSpeechSynthesisConfig

	^ self basicSpeechSynthesisConfig ifNil:
		[self speechSynthesisConfig: self speechSynthesisConfig.
		self basicSpeechSynthesisConfig]