private
generateReplyFor: aConversation config: aConfig

	aConfig mockConfig reply ifNotNil: [:reply |
		"Can be a string, SemanticMessage, or a block ([:conversation :index | ...])."
		^ {reply}].
	
	aConfig outputModalities ifNil: [^ {self generateReplyTextFor: aConversation config: aConfig}].
	^ Array streamContents: [:stream |
		(aConfig outputModalities includes: #audio) ifTrue:
			[stream nextPut: (self generateReplyAudioFor: aConversation config: aConfig)].
		(aConfig outputModalities includes: #text) ifTrue:
			[stream nextPut: (self generateReplyTextFor: aConversation config: aConfig)]]