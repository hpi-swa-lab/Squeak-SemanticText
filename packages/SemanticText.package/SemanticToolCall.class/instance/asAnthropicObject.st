*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	^ JsonObject new
		id: self key;
		type: 'tool_use';
		name: self toolName;
		input: self arguments;
		yourself