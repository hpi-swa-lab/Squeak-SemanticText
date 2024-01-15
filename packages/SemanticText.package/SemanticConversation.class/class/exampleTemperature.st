documentation
exampleTemperature

	SemanticConversation new
		withConfigDo: [:config |
			config temperature: 1.9.
			config maxTokens: 200 "high temperatures may cause the model to output nonsense and not find an end!"];
		addUserMessage: 'What is a computer?';
		getAssistantReply