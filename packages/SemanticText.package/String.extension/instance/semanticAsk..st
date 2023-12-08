*SemanticText
semanticAsk: questionOrQueryString

	^ SemanticConversation new
		addSystemMessage: 'Read this:';
		addUserMessage: self;
		addSystemMessage: 'Answer the following question or query about the above text:';
		addUserMessage: questionOrQueryString;
		getAssistantReply