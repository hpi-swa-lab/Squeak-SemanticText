accessing
speechTranscriptionModel

	^ self basicSpeechTranscriptionModel ifNil:
		[SemanticText defaultSpeechTranscriptionModel]