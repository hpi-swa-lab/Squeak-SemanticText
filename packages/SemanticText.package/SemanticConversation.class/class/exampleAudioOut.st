documentation
exampleAudioOut

	SemanticConversation newStreaming
		model: ((Smalltalk classNamed: #OpenAIConversationModel) named: #gpt4oAudioPreviewName);
		updateConfig: [:config |
			config outputModalities: #(text audio).
			config speechSynthesisConfig voice: #ash];
		addUserMessage: 'Tell me a joke!';
		openAndComplete.