documentation
exampleRealtime

	| window |
	window := SemanticConversation newStreaming
		model: ((Smalltalk classNamed: #OpenAIConversationModel) named: #gptRealtime2Name);
		open.
	window model voiceModeEnabled: true.
	^ window