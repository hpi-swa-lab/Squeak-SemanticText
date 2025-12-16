*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeObject

	self assert: (self type ifNil: [#function]) = #function.
	^ JsonObject new
		type: 'function_call';
		id: self id;
		call_id: self key;
		name: self toolName;
		arguments: self argumentsJsonString;
		yourself