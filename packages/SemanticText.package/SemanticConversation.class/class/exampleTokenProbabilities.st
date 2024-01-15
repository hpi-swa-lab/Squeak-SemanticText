documentation
exampleTokenProbabilities

	(SemanticConversation new
		withConfigDo: [:config |
			config shouldLogProbabilities: true];
		addSystemMessage: 'complete up to ten';
		addUserMessage: 'one aquarium\two blue whales\three clownfishes' withCRs;
		getAssistantMessage)
			contentWithStyledProbabilities edit.