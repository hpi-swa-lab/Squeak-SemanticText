documentation
exampleRandomDistribution
	"Compare the random distribution of using the <number> parameter of the model versus making <number> separate requests."

	(SemanticConversation new
		updateConfig: [:config |
			config maxTokens: 5];
		addUserMessage: 'tell me a joke';
		"estimatePriceToGetAssistantMessages: 50"
		getAssistantReplies: 50)
			asBag explore.
	
	((1 to: 50) semanticConcurrentCollect:
		[SemanticConversation new
			updateConfig: [:config |
				config maxTokens: 5];
			addUserMessage: 'tell me a joke';
			"estimatePriceToGetAssistantMessage) * 50"
			getAssistantReply])
				asBag explore.