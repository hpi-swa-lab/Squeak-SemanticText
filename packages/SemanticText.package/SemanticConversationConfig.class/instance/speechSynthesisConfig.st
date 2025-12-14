accessing - speech
speechSynthesisConfig

	^ self argumentAt: #speechSynthesisConfig ifAbsentPut:
		[SemanticSpeechSynthesisConfig new]