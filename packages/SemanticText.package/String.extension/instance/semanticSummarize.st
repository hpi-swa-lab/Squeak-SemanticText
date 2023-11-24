*SemanticText
semanticSummarize

	^ SemanticConversation new
		addSystemMessage: 'Summarize this:';
		addUserMessage: self;
		getAssistantReply