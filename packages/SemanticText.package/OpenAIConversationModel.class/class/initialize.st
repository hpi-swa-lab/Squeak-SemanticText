initialize-release
initialize

	| model |
	self flag: #forLater. "Use OpenAI Models API and register an instance of each model."
	
	model := self new name: self gpt35Name.
	SemanticText registerConversationModel: model.
	(SemanticText defaultModelOrNilFor: #conversation) ifNil:
		[SemanticText defaultConversationModel: model].
	
	SemanticText registerConversationModel: (self new name: self gpt4Name).