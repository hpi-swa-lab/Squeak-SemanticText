*SemanticText-Model-Conversation
semanticComplete: anInteger

	self flag: #remark. "Note that true completion models are currently not supported."
	
	^ (SemanticConversation new
		addSystemMessage: ('Complete the next {1} characters of the provided string. Answer only the new part of the string in a JSON object (\{"completion": "..."}).' format: {anInteger});
		addUserMessage: self asJsonString;
		withConfigDo: [:config |
			config temperature: 0.
			config openAIRawConfig response_format: (JsonObject new type: 'json_object'; yourself)];
		getAssistantReply)
			parseAsJson completion
	
	"'It''s easier to invent the future than' semanticComplete: 16"