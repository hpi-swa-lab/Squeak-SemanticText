documentation
exampleRealtime

	| window |
	window := SemanticConversation newStreaming
		model: ((Smalltalk classNamed: #OpenAIConversationModel) named: #gptRealtimeName);
		open.
	window model voiceModeEnabled: true.
	^ window