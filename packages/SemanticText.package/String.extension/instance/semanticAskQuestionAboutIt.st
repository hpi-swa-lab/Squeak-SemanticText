*SemanticText
semanticAskQuestionAboutIt

	self isAllSeparators ifTrue: [^ self inform: 'nothing to ask'].
	^ SemanticConversation newStreaming
		addSystemMessage: 'Read this:';
		addUserMessage: self;
		addSystemMessage: 'Answer the following question or query about the above text:';
		open