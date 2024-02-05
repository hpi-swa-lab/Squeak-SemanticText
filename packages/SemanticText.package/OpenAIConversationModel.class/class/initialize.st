initialize-release
initialize

	self defaultModelNames do: [:modelName |
		| model |
		model := self new name: modelName.
		SemanticText registeredConversationModels
			detect: [:ea | ea name = model name]
			ifNone:
				[SemanticText registerConversationModel: model.
				SemanticText defaultConversationModelOrNil ifNil:
					[SemanticText defaultConversationModel: model]]].