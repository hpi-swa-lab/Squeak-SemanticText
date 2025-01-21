*SemanticText-Providers-Anthropic-converting
asAnthropicToolChoiceObject

	^ JsonObject new
		type: self type;
		function:
			(JsonObject new
				name: self name;
				yourself)