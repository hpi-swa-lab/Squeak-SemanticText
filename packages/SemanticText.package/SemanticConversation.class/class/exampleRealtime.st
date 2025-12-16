documentation
exampleRealtime

	| window |
	window := SemanticConversation newStreaming
		model: ((Smalltalk classNamed: #OpenAIConversationModel) named: #gptRealtimeName);
		updateConfig: [:config |
			config shouldDetectVoiceActivity];
		open.
	window model voiceModeEnabled: true.
	^ window