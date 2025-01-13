*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	^ OrderedJsonObject new
		name: self name;
		in: [:json |
			self description ifNotNil:
				[json description: self description]];
		input_schema:
			(JsonObject new
				type: #object;
				properties:
					(self parameters collect: [:parameter | parameter asAnthropicObject]);
				required:
					(self parameters asArray
						select: [:parameter | parameter required]
						thenCollect: [:parameter | parameter name]);
				yourself);
		yourself