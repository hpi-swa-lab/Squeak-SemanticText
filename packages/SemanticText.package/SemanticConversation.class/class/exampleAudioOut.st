documentation
exampleAudioOut

	SemanticConversation newStreaming
		model: (OpenAIConversationModel named: #gpt4oAudioPreviewName);
		withConfigDo: [:config |
			config outputModalities: #(text audio).
			config speechSynthesisConfig voice: #ash];
		addUserMessage: 'Tell me a joke!';
		openAndComplete.