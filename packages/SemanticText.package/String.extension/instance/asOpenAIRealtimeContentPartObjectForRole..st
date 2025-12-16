*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeContentPartObjectForRole: role

	^ JsonObject new
		type: (role = #assistant ifTrue: ['output_text'] ifFalse: ['input_text']);
		text: self;
		yourself