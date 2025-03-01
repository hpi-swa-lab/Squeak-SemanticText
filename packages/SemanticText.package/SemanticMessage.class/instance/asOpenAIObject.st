*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	| openAIContentParts audioUpdate jsonObject |
	openAIContentParts := OrderedCollection withAll: self contentParts.
	self propertyValueAt: #audio ifPresent: [:audio |
		audioUpdate := self openAIAudioUpdate: openAIContentParts for: audio].
	jsonObject := JsonObject new
		role: self role;
		content:
			(openAIContentParts collect: [:part | part asOpenAIContentPartObject]);
		yourself.
	self basicToolCalls ifNotNil: [:calls |
		jsonObject tool_calls:
			(calls collect: [:toolCall | toolCall asOpenAIObject])].
	^ jsonObject