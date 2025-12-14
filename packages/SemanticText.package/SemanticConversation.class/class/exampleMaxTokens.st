documentation
exampleMaxTokens

	SemanticConversation new
		updateConfig: [:config |
			config maxTokens: 10];
		addUserMessage: 'count from 0 to 100. answer numbers only.';
		getAssistantReply