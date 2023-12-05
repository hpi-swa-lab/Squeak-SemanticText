*SemanticText-Model-Conversation-updating
semanticCompletedConversation: aConversation for: textSelector

	Smalltalk isMorphic ifFalse:
		[^ Project current addDeferredUIMessage: [self changed: textSelector]].
	
	Project current addDeferredUIMessage:
		[self changed: #insertTextReplacement with:
			{textSelector. ''. aConversation cursorText. true}].