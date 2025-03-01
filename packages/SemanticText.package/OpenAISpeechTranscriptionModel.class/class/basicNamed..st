support
basicNamed: aString

	^ SemanticText registeredSpeechTranscriptionModels detect: [:model | model name = aString]