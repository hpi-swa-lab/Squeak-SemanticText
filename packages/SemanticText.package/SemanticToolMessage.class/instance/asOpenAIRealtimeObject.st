*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeObject

	self assert: (self toolCall type ifNil: [#function]) = #function.
	^ JsonObject new
		type: 'function_call_output';
		id: self id;
		call_id: self key;
		output: self contentString;
		yourself