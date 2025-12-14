updating - conversation
semanticNewChunk: chunk from: streamingConversationItem for: textSelector 

	streamingConversationItem isSemanticToolCall ifTrue:
		[self isDisplayingRawConversation ifFalse: [^ self]].
	
	Smalltalk isMorphic ifFalse:
		[^ super semanticNewChunk: chunk from: streamingConversationItem for: textSelector].
	
	Project current addDeferredUIMessage:
		[| cursor attribute |
		cursor := streamingConversationItem cursorText.
		attribute := streamingConversationItem asSemanticConversationEditorAttribute.
		self changed: #insertTextReplacement with:
			{textSelector.
			chunk isText
				ifFalse: [chunk , cursor]
				ifTrue:
					[chunk , cursor
						addAttribute: attribute;
						yourself].
			cursor asText
				addAttribute: attribute;
				yourself.
			true}].