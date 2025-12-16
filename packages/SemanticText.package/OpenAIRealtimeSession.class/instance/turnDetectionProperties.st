client events - private
turnDetectionProperties

	| properties |
	self shouldDetectVoiceActivity ifFalse: [^ nil].
	
	properties := self voiceActivityDetectionStrategy
		caseOf:
			{[#server] ->
				[JsonObject new
					type: 'server_vad';
					create_response: true;
					interrupt_response: true;
					yourself].
			[#semantic] ->
				[JsonObject new
					type: 'semantic_vad';
					create_response: true;
					interrupt_response: true;
					yourself]}.
	
	self config openAIRealtimeVoiceActivityDetectionRawConfigOrNil ifNotNil: [:json |
		properties := properties , json].
	
	^ properties