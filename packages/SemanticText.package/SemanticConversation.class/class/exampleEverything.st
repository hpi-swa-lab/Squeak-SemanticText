documentation
exampleEverything

	(SemanticConversation newStreaming
		updateConfig: [:config |
			config temperature: 1.2.
			config shouldLogProbabilities: true.
			config openAIRawConfig top_logprobs: 5.
			config shouldLogRawOutput: true.
			config maxTokens: 200];
		addUserMessage: 'What time and day is it?';
		pushFunctions: {SemanticFunction fromString: 'getTime' action: [Time now]. SemanticFunction fromString: 'getDate' action: [Date today]};
		getAssistantMessages: 2)
			explore.