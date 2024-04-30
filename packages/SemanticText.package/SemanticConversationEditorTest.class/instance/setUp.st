running
setUp

	super setUp.
	
	editor := self classToBeTested new.
	editor conversation model: SemanticMockConversationModel new.
	editor isStreaming: false.