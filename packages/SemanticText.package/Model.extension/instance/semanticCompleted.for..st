*SemanticText-Model-Conversation-updating
semanticCompleted: streamingConversationItem for: textSelector

	Smalltalk isMorphic ifFalse:
		[^ Project current addDeferredUIMessage: [self changed: textSelector]].
	
	Project current addDeferredUIMessage:
		[self changed: #insertTextReplacement with:
			{textSelector.
			''.
			streamingConversationItem cursorText.
			true}].