documentation
exampleFunction

	| conversation message |
	conversation := SemanticConversation new.
	message := conversation
		addUserMessage: 'What time is it?';
		addFunction: (SemanticFunction fromString: 'getTime' action: [Time now]);
		getAssistantMessage.
	message waitUntilComplete.
	conversation resolveAllToolCalls ifTrue:
		[message := conversation getAssistantMessage].
	conversation open.