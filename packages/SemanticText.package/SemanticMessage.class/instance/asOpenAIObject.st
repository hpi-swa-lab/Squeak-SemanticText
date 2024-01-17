*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	| jsonObject |
	jsonObject := JsonObject new
		role: self role;
		content: self basicContent;
		yourself.
	self basicToolCalls ifNotNil: [:calls |
		jsonObject tool_calls:
			(calls collect: [:toolCall | toolCall asOpenAIObject])].
	^ jsonObject