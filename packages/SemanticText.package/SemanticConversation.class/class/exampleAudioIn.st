documentation
exampleAudioIn

	SemanticConversation newStreaming
		model: (OpenAIConversationModel named: #gpt4oAudioPreviewName);
		addUserMessage: SampledSound semanticFromUser;
		openAndComplete.