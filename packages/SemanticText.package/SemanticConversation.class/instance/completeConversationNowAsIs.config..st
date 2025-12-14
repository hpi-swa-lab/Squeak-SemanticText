assistant
completeConversationNowAsIs: aBoolean config: aConfigOrNil

	(SemanticConversationCompletion newFor: self config: aConfigOrNil)
		completeConversationAsIs: aBoolean.