updating - conversation
semanticCompleted: streamingConversationItem for: textSelector

	Smalltalk isMorphic ifFalse:
		[^ super semanticCompleted: streamingConversationItem for: textSelector].
	
	Project current addDeferredUIMessage:
		[self changed: #insertTextReplacement with:
			{textSelector.
			''.
			streamingConversationItem cursorText asText
				addAttribute: streamingConversationItem asSemanticConversationEditorAttribute;
				yourself.
			true}].