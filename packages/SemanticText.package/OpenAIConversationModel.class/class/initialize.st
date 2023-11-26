initialize-release
initialize

	| model |
	self flag: #forLater. "Use OpenAI Models API and register an instance of each model."
	
	model := self new name: self gpt35Name.
	SemanticText registeredConversationModels
		detect: [:ea | ea name = model name]
		ifNone:
			[SemanticText registerConversationModel: model.
			SemanticText defaultConversationModelOrNil ifNil:
				[SemanticText defaultConversationModel: model]].
	
	{self gpt4Name. self gpt4TurboPreviewName} do: [:modelName |
		model := self new name: modelName.
		SemanticText registeredConversationModels
			detect: [:ea | ea name = model name]
			ifNone:
				[SemanticText registerConversationModel: model]].