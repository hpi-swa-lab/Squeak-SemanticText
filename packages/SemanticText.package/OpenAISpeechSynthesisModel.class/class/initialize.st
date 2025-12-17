initialize-release
initialize

	self defaultModelNames do: [:modelName |
		| model |
		model := self newWithName: modelName.
		SemanticText registeredSpeechSynthesisModels
			detect: [:ea | ea name = model name]
			ifNone:
				[SemanticText registerSpeechSynthesisModel: model.
				SemanticText defaultSpeechSynthesisModelOrNil ifNil:
					[SemanticText defaultSpeechSynthesisModel: model]]].