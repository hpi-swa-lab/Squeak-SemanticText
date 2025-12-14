documentation
examplePluralStreaming

	(SemanticConversation newStreaming
		addUserMessage: 'What time is it? Answer creatively.';
		addFunction: #getTime action: [Time now];
		getCompletedConversations: 2)
			do: [:conversation |
				| workspace append |
				workspace := Workspace open.
				append := [:string | workspace contents: workspace contents , string].
				conversation
					when: #newMessage evaluate: [:message |
						append future value: ('[{1}] ' format: {message role}).
						message isStreaming
							ifTrue:
								[message
									when: #newChunk evaluate: [:chunk | append future value: chunk];
									when: #completed evaluate: [append future value: String cr]]
							ifFalse:
								[append future value: message content asString , String cr]];
					when: #completed evaluate:
						[append future value: String cr]].