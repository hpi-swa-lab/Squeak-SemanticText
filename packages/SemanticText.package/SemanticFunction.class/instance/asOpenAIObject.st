*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	^ OrderedJsonObject new
		type: self type;
		function:
			(OrderedJsonObject new
				name: self name;
				in: [:json |
					self description ifNotNil:
						[json description: self description]];
				parameters:
					(JsonObject new
						type: #object;
						properties:
							(self parameters collect: [:parameter | parameter asOpenAIObject]);
						required:
							(self parameters asArray
								select: [:parameter | parameter required]
								thenCollect: [:parameter | parameter name]);
						yourself);
				yourself);
		yourself