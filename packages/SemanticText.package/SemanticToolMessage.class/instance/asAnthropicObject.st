*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	| jsonObject |
	jsonObject := super asAnthropicObject.
	jsonObject tool_call_id: self key.
	jsonObject content: self basicContent.
	^ jsonObject