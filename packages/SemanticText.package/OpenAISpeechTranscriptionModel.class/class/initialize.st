initialize-release
initialize

	| model |
	model := self new.
	SemanticText registeredSpeechTranscriptionModels
		detect: [:ea | ea name = model name]
		ifNone:
			[SemanticText registerSpeechTranscriptionModel: model.
			SemanticText defaultSpeechTranscriptionModelOrNil ifNil:
				[SemanticText defaultSpeechTranscriptionModel: model]].