*SemanticText-Providers-OpenAI-converting
asOpenAIToolChoiceObject

	^ JsonObject new
		type: self type;
		function:
			(JsonObject new
				name: self name;
				yourself);
		yourself