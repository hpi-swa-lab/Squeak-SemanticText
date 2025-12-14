documentation
exampleDeterminism
	"NOTE: Beta feature!"

	(#(false true) semanticConcurrentCollect: [:useSeed |
		((1 to: 5) semanticConcurrentCollect: [:i |
			| message |
			message := SemanticConversation new
				updateConfig: [:config |
					config maxTokens: 5.
					config shouldLogRawOutput: true.
					useSeed ifTrue:
						[config openAIRawConfig seed: 1337]];
				addUserMessage: 'Random number between 0 and 100, answer only the number';
				getAssistantMessage.
			message rawOutput chatCompletion system_fingerprint -> message content])
				asBag])
					explore.