*SemanticText-Providers-OpenAI-converting
asOpenAIContentPartObject

	^ JsonObject new
		type: #text;
		text: self;
		yourself