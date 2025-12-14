initialize-release
initialize

	self defaultModelNames do: [:modelName |
		| model |
		model := self new name: modelName.
		SemanticText registeredSpeechTranscriptionModels
			detect: [:ea | ea name = model name]
			ifNone:
				[SemanticText registerSpeechTranscriptionModel: model.
				SemanticText defaultSpeechTranscriptionModelOrNil ifNil:
					[SemanticText defaultSpeechTranscriptionModel: model]]].