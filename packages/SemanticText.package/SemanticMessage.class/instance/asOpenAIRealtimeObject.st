*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeObject

	self flag: #todo. "flag audio transcript parts and exclude them here"
	^ JsonObject new
		type: #message;
		id: self id;
		role: self role;
		content:
			(self contentParts collect: [:part |
				part asOpenAIRealtimeContentPartObjectForRole: self role]);
		yourself