documentation
exampleStreamingConversation
	"Don't forget to provide an OpenAI key first (see #defaultKey)!"

	^ (SemanticConversation newStreaming
		addUserMessage: 'What time is it?';
		addFunction: #getTime action: [Time now];
		completeConversation)
			when: #newMessage evaluate: [:message |
				Transcript future showln: ('[{1}] ' format: {message role}).
				message isStreaming
					ifTrue:
						[message
							when: #newChunk evaluate: [:chunk | Transcript future show: chunk];
							when: #completed evaluate: [Transcript future show: '']]
					ifFalse:
						[Transcript future show: message content]];
			when: #completed evaluate: [Transcript future showln: '']