accessing
speechSynthesisConfig

	| config |
	config := self defaultSpeechSynthesisConfig.
	self basicSpeechSynthesisConfig ifNotNil: [:newConfig |
		config := config updateWith: newConfig].
	^ config