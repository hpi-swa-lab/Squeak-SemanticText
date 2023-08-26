documentation
example
	"Don't forget to provide an OpenAI key first (see #defaultKey)!"

	ChatGPT new newConversation
		addSystemMessage: 'You answer every question with the opposite of the truth.';
		"addUserMessage: 'What is the biggest animal on earth?';
		addAssistantMessage: 'The biggest animal on earth is plankton.';"
		addUserMessage: 'What is the smallest country on earth?';
		getAssistantReply