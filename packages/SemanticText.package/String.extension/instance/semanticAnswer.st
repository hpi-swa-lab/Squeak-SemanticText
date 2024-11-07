*SemanticText-Model-Conversation
semanticAnswer

	^ SemanticConversation new
		addSystemMessage: 'Answer the following question. Keep your question a single brief expression if possible.';
		addUserMessage: self;
		getAssistantReply
	
	"'smalltalk inventor' semanticAnswer"