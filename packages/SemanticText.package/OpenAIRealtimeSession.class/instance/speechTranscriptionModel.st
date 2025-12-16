private - configuration
speechTranscriptionModel

	^ self config speechTranscriptionModelName
		ifNotNil: [:name | SemanticText speechTranscriptionModelNamed: name]
		ifNil: [SemanticText defaultSpeechTranscriptionModel]