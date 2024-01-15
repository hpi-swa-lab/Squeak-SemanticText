documentation
exampleStreaming
	"Don't forget to provide an OpenAI key first (see #defaultKey)!"

	(SemanticConversation newStreaming
		addUserMessage: 'What is the smallest country on earth?';
		getAssistantMessage)
			when: #newChunk evaluate: [:chunk | Transcript future show: chunk];
			when: #completed evaluate: [Transcript future showln: ''].