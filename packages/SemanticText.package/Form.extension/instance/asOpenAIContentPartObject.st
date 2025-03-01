*SemanticText-Providers-OpenAI-converting
asOpenAIContentPartObject

	self flag: #todo. "how can we support configuring level of detail?"
	^ JsonObject new
		type: 'image_url';
		at: 'image_url' put:
			(JsonObject new
				url: self openAIAsDataUrl;
				yourself);
		yourself