*SemanticText-Providers-OpenAI-converting
asOpenAIRealtimeObject

	^ OrderedJsonObject new
		type: self type;
		name: self name;
		description: self description;
		parameters:
			(JsonObject new
				type: #object;
				properties:
					(self parameters collect: [:parameter | parameter asOpenAIObject]);
				required:
					(self parameters asArray
						flag: #todo; "actually supported in realtime??"
						select: [:parameter | parameter required]
						thenCollect: [:parameter | parameter name]);
				yourself);
		yourself