documentation
exampleTokenProbabilities

	(SemanticConversation new
		model: (SemanticText conversationModelNamed: OpenAIConversationModel gpt4oName);
		withConfigDo: [:config |
			config shouldLogProbabilities: true];
		addSystemMessage: 'complete up to ten';
		addUserMessage: 'one aquarium\two blue whales\three clownfishes' withCRs;
		getAssistantMessage)
			content edit.