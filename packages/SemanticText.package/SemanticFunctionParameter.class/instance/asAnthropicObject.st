*SemanticText-Providers-Anthropic-converting
asAnthropicObject
	"Note: this is exactly the same as SemanticFunctionParameter>>asOpenAIObject"
	^ (true
		caseOf:
			{[self type isNil] -> [JsonObject new].
			[self type isString] -> [JsonObject new type: self type; yourself]}
		otherwise: [self type])
			in: [:json |
				self description ifNotNil:
					[json description: self description]];
			yourself