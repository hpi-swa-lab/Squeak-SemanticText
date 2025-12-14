documentation
exampleRAG

	^ SemanticConversation new
		addSystemMessage: 'You are an assistant that answers questions about the SemanticText package.';
		addFunction: #searchDocumentation argsAction: [:searchTerm |
			(SemanticText packageInfo methods collect: #source) asSemanticCorpus
				findObjects: 10 similarToQuery: searchTerm];
		addUserMessage: 'how can i change the temperature of a conversation?';
		getCompleteAssistantReply