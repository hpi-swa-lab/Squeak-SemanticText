*SemanticText-Providers-OpenAI-converting
asOpenAIContentPartObject

	^ JsonObject new
		type: 'input_audio';
		at: 'input_audio' put:
			(JsonObject new
				data: self openAIAsWaveBase64String;
				format: 'wav';
				yourself);
		yourself