documentation
exampleFunction

	| conversation |
	conversation := SemanticConversation new.
	conversation
		addUserMessage: 'What time is it?';
		addFunction: #getTime action: [Time now];
		completeConversation.
	conversation open.