*SemanticText
semanticExplainIt

	self isAllSeparators ifTrue: [^ self inform: 'nothing to explain'].
	^ SemanticConversation newStreaming
		addSystemMessage: 'Explain this:';
		addUserMessage: self;
		openAndComplete