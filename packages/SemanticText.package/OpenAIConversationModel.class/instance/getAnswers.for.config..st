service
getAnswers: number for: aConversation config: aConfigOrNil
	"Generate <number> assistant replies in response to aConversation. Answer a collection of new SemanticMessages for each new reply. If #shouldStream is set to true, the answers will be SemanticStreamingMessages that are completed in the background."

	| chatCompletion logRawOutput stream |
	chatCompletion := self
		invokeWithConfig: aConfigOrNil
		editInput: [:input :config |
			input n: number.
			config maxTokens ifNotNil: [:maxTokens |
				input max_tokens: maxTokens].
			
			config temperature ifNotNil: [:temperature |
				input temperature: temperature].
			config nucleusSamplingMass ifNotNil: [:p |
				input top_p: p].
			
			config shouldLogProbabilities ifNotNil: [:shouldLogProbabilities |
				input logprobs: shouldLogProbabilities].
			logRawOutput := false.
			config shouldLogRawOutput ifNotNil: [:shouldLogRawOutput |
				logRawOutput := shouldLogRawOutput].
			
			stream := false.
			config shouldStream ifNotNil: [:shouldStream |
				stream := shouldStream.
				input stream: stream].
			
			input messages:
				(aConversation messages collect: [:message |
					JsonObject new
						role: message role;
						content: message content;
						yourself])]
		handleResponse: [:response :config |
			(stream and: [response isSuccess]) ifTrue:
				[^ self handleStreamingReplies: number for: aConversation from: response config: config logRawOutput: logRawOutput]].
	
	^ self parseMessagesFrom: chatCompletion logRawOutput: logRawOutput