*SemanticText-Model-Conversation
semanticComplete: anIntegerOrNil

	self flag: #remark. "Note that true completion models are currently not supported."
	
	^ (SemanticConversation new
		addSystemMessage: ('Complete {1}the provided string. Answer only the new part of the string in a JSON object (\{"completion": "..."}).' format: {anIntegerOrNil ifNil: [''] ifNotNil: ['the next {1} characters of ' format: {anIntegerOrNil}]});
		addUserMessage: self asJsonString;
		updateConfig: [:config |
			config temperature: 0.
			config openAIRawConfig response_format: (JsonObject new type: 'json_object'; yourself)];
		getAssistantReply)
			parseAsJson completion
	
	"'It''s easier to invent the future than' semanticComplete: 16"