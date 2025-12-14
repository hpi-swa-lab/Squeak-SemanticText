accessing
updateSpeechSynthesisConfig: aBlock

	aBlock value: self assureSpeechSynthesisConfig.
	self changed: #speechSynthesisConfig.