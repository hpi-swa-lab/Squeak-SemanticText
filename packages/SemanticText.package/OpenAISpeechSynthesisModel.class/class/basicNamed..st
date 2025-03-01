support
basicNamed: aString

	^ SemanticText registeredSpeechSynthesisModels detect: [:model | model name = aString]