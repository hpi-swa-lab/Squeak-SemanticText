accessing
speechSynthesisModel

	^ self basicSpeechSynthesisModel ifNil:
		[SemanticText defaultSpeechSynthesisModel]