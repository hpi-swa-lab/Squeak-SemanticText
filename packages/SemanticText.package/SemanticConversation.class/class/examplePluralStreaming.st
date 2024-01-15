documentation
examplePluralStreaming

	(SemanticConversation newStreaming
		addUserMessage: 'Define Squeak/Smalltalk!';
		getAssistantMessages: 2)
			do: [:message |
				| workspace |
				workspace := Workspace open.
				message
					when: #newChunk evaluate: [:chunk | [workspace contents: workspace contents , chunk] future value];
					when: #completed evaluate: [[workspace contents: workspace contents , String cr] future value]].