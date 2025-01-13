*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	self assert: (self type ifNil: [#function]) = #function.
	^ JsonObject new
		id: self key;
		type: (self type ifNil: [#function]);
		function:
			(JsonObject new
				name: self toolName;
				arguments: self argumentsJsonString);
		yourself