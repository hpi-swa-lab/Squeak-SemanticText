*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeContentPartObjectForRole: role

	^ JsonObject new
		type: (role = #assistant ifTrue: ['output_audio'] ifFalse: ['input_audio']);
		audio: self openAIAsWaveBase64String;
			flag: #todo; "does this work? 'This defaults to PCM 16-bit 24kHz mono if not specified.'"
		yourself