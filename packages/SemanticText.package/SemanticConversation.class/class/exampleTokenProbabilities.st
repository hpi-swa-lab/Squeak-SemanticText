documentation
exampleTokenProbabilities

	(SemanticConversation new
		model: ((Smalltalk classNamed: #OpenAIConversationModel) named: #gpt4oName);
		updateConfig: [:config |
			config shouldLogProbabilities: true];
		addSystemMessage: 'complete up to ten';
		addUserMessage: 'one aquarium\two blue whales\three clownfishes' withCRs;
		getAssistantMessage)
			content edit.