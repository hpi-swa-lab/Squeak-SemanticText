documentation
exampleRawParameters
	"Requires an OpenAIConversationModel."

	(SemanticConversation new
		withConfigDo: [:config |
			"config shouldStream: true."
			config shouldLogProbabilities: true.
			config openAIRawConfig top_logprobs: 5.
			config shouldLogRawOutput: true];
		addSystemMessage: 'complete up to ten';
		addUserMessage: 'one aquarium\two blue whales\three clownfishes' withCRs;
		getAssistantMessage)
			explore.