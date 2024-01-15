documentation
exampleMaxTokens

	SemanticConversation new
		withConfigDo: [:config |
			config maxTokens: 10];
		addUserMessage: 'count from 0 to 100. answer numbers only.';
		getAssistantReply