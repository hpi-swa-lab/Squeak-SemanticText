accessing - speech
speechTranscriptionConfig

	^ self argumentAt: #speechTranscriptionConfig ifAbsentPut:
		[SemanticSpeechTranscriptionConfig new]