*SemanticText-Providers-OpenAI-converting
asOpenAIObject

	| openAIContentParts audioUpdate jsonObject |
	openAIContentParts := OrderedCollection withAll: self contentParts.
	self propertyValueAt: #audio ifPresent: [:audio |
		audioUpdate := self openAIAudioUpdate: openAIContentParts for: audio.
		audioUpdate ifNil: [self propertyValueRemoveAt: #audio]].
	jsonObject := JsonObject new
		role: self role;
		content:
			((openAIContentParts reject: [:part | part semanticIsSound and: [self role = #assistant]]) collect: [:part | part asOpenAIContentPartObject]);
		yourself.
	audioUpdate ifNotNil: [audioUpdate value: jsonObject].
	self basicToolCalls ifNotNil: [:calls |
		jsonObject tool_calls:
			(calls collect: [:toolCall | toolCall asOpenAIObject])].
	^ jsonObject