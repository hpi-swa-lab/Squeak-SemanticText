*SemanticText
semanticExplain

	^ SemanticConversation new
		addSystemMessage: 'Explain this:';
		addUserMessage: self;
		getAssistantReply