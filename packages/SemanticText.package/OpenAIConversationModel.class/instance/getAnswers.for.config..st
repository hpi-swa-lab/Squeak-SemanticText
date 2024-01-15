service
getAnswers: number for: aConversation config: aConfigOrNil
	"Generate <number> assistant replies in response to aConversation. Answer a collection of new SemanticMessages for each new reply. If #shouldStream is set to true, the answers will be SemanticStreamingMessages that are completed in the background."

	| stream chatCompletion |
	chatCompletion := self
		invokeWithConfig: aConfigOrNil
		editInput: [:input :config |
			input n: number.
			
			config temperature ifNotNil: [:temperature |
				input temperature: temperature].
			
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
				[^ self handleStreamingReplies: number for: aConversation from: response config: config]].
	
	^ self parseMessagesFrom: chatCompletion