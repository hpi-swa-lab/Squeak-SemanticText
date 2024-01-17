*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	^ (true
		caseOf:
			{[self type isNil] -> [JsonObject new].
			[self type isString] -> [JsonObject new type: self type; yourself]}
		otherwise: [self type])
			description: self description;
			yourself