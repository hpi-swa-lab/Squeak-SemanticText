*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeContentPartObjectForRole: role

	self flag: #todo. "how can we support configuring level of detail?"
	^ JsonObject new
		type: 'input_image';
		at: 'image_url' put: self openAIAsDataUrl;
		yourself