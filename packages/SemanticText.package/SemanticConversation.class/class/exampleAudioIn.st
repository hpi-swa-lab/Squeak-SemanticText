documentation
exampleAudioIn

	SemanticConversation newStreaming
		model: ((Smalltalk classNamed: #OpenAIConversationModel) named: #gpt4oAudioPreviewName);
		addUserMessage: SampledSound semanticFromUser;
		openAndComplete.