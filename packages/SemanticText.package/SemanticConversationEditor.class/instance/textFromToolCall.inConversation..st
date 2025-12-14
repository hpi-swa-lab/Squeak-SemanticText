private - text
textFromToolCall: aToolCall inConversation: aConversation

	| toolMessage |
	self isDisplayingRawConversation ifTrue: [^ self textFromRawToolCall: aToolCall].
	
	toolMessage := aConversation messages
		detect: [:message | message isToolMessage and: [message toolCall == aToolCall]]
		ifNone: [nil].
	^ Text streamContents: [:stream |
		stream
			withAttributes:
				(Array
					with: aToolCall asSemanticConversationEditorAttribute
					with: TextEmphasis italic
					with:
						(TextInspectIt on: aToolCall -> (toolMessage ifNotNil: [toolMessage content])))
			do:
				[stream nextPut: $[.
				stream nextPutAll: aToolCall toolName.
				toolMessage ifNil:
					[stream nextPutAll: '...'].
				stream nextPut: $]]]