*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	^ (true
		caseOf:
			{[self type isNil] -> [JsonObject new].
			[self type isString] -> [JsonObject new type: self type; yourself]}
		otherwise: [self type])
			in: [:json |
				self description ifNotNil:
					[json description: self description]];
			yourself