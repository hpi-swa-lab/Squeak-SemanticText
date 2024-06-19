initialize-release
initialize

	| model |
	model := self new.
	SemanticText registeredSpeechSynthesisModels
		detect: [:ea | ea name = model name]
		ifNone:
			[SemanticText registerSpeechSynthesisModel: model.
			SemanticText defaultSpeechSynthesisModelOrNil ifNil:
				[SemanticText defaultSpeechSynthesisModel: model]].
	
	{self tts1HDName} do: [:modelName |
		model := self new name: modelName.
		SemanticText registeredSpeechSynthesisModels
			detect: [:ea | ea name = model name]
			ifNone:
				[SemanticText registerSpeechSynthesisModel: model]].