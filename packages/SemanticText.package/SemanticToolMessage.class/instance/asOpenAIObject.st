*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	| jsonObject |
	jsonObject := super asOpenAIObject.
	jsonObject tool_call_id: self key.
	^ jsonObject