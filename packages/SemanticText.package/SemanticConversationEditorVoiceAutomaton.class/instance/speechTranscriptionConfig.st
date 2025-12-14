accessing
speechTranscriptionConfig

	| config |
	config := self defaultSpeechTranscriptionConfig.
	self basicSpeechTranscriptionConfig ifNotNil: [:newConfig |
		config := config updateWith: newConfig].
	^ config