*SemanticText
semanticExplainIt

	| editor |
	self isAllSeparators ifTrue: [^ self inform: 'nothing to explain'].
	editor := SemanticConversation newStreaming
		addSystemMessage: 'Explain this:';
		addUserMessage: self;
		open.
	(editor model future: 1) completeAsIs. "must defer this after first world cycle!"
	^ editor