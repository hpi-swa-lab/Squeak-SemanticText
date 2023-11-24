*SemanticText
semanticSummarizeIt

	| editor |
	self isAllSeparators ifTrue: [^ self inform: 'nothing to summarize'].
	editor := SemanticConversation newStreaming
		addSystemMessage: 'Summarize this:';
		addUserMessage: self;
		open.
	(editor model future: 1) completeAsIs. "must defer this after first world cycle!"
	^ editor