*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	| jsonObject |
	jsonObject := JsonObject new
		role: self role;
		content: self content;
		yourself.
	self basicToolCalls ifNotNil: [:calls |
		jsonObject tool_calls:
			(calls collect: [:toolCall | toolCall asAnthropicObject])].
	^ jsonObject