*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	| jsonObject |
	jsonObject := super asAnthropicObject.
	jsonObject role: 'user'.
	jsonObject content: {
		(JsonObject new
			type: 'tool_result';
			tool_use_id: self key;
			content: self basicContent;
			yourself)
	}.
	^ jsonObject