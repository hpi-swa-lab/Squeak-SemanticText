*SemanticText-Providers-Anthropic-converting
asAnthropicObject

	| jsonObject |
	jsonObject := JsonObject new
		role: self role;
		content: self content;
		yourself.
	"If any tool calls are present, we'll have to return an array of content blocks, not a plain string"
	self basicToolCalls ifNotNil: [:calls |
		| textContent contentBlocks |
		textContent := self content isString ifTrue: [self content] ifFalse: [self content first text].
		contentBlocks := 
			{JsonObject new type: 'text'; text: textContent; yourself} ,
			(calls collect: [:toolCall | toolCall asAnthropicObject]).
		jsonObject content: contentBlocks
	].
	^ jsonObject