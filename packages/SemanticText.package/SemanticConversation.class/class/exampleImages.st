documentation
exampleImages

	SemanticConversation newStreaming
		addUserMessage: StarMorph new imageForm;
		addUserMessage: {RectangleMorph new color: Color red; imageForm. WatchMorph new imageForm. 'How many images can you see? Describe each one separately in detail. Also include images shared below.'. RectangleMorph new color: Color white; imageForm};
		addUserMessage: 'This is bob (you MUST ALWAYS refer to his name or he will be sad):' asText , (EllipseMorph new color: Color blue; imageForm) semanticContentPartText;
		openAndComplete.