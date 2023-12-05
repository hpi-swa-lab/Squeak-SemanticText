*SemanticText-Model-Conversation-updating
semanticNewChunk: chunk fromConversation: aConversation for: textSelector

	Smalltalk isMorphic ifFalse:
		[^ Project current addDeferredUIMessage: [self changed: textSelector]].
	
	Project current addDeferredUIMessage:
		[self changed: #insertTextReplacement with:
			{textSelector. chunk , aConversation cursorText. aConversation cursorText. true}].