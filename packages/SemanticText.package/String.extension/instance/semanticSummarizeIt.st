*SemanticText
semanticSummarizeIt

	self isAllSeparators ifTrue: [^ self inform: 'nothing to summarize'].
	^ SemanticConversation newStreaming
		addSystemMessage: 'Summarize this:';
		addUserMessage: self;
		openAndComplete