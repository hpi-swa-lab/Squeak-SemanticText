*SemanticText-Model-Conversation-updating
semanticNewChunk: chunk from: streamingConversationItem for: textSelector

	Smalltalk isMorphic ifFalse:
		[^ Project current addDeferredUIMessage: [self changed: textSelector]].
	
	Project current addDeferredUIMessage:
		[self changed: #insertTextReplacement with:
			{textSelector.
			chunk , streamingConversationItem cursorText.
			streamingConversationItem cursorText.
			true}].