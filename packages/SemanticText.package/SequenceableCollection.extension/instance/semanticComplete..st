*SemanticText-Model-Conversation
semanticComplete: anInteger

	^ (SemanticConversation new
		addSystemMessage: ('Complete the next {1} elements of the provided sequence. Answer results in a JSON array (\{"items": [...]}).' format: {anInteger});
		addUserMessage: self asJsonString;
		updateConfig: [:config |
			config temperature: 0.
			config openAIRawConfig response_format: (JsonObject new type: 'json_object'; yourself)];
		getAssistantReply)
			parseAsJson items
	
	"#(apple banana cherry) semanticComplete: 5"
	
	"numbers := (1 to: 17) collect: [:ea | ea * 23 \\ 17].
	completed := (numbers first: 10) semanticComplete: 7.
	(numbers allButFirst: 10) - completed"