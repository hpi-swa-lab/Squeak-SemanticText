service
getAnswerFor: aConversation config: aConfigOrNil
	"Generate an assistant reply in response to aConversation. Answer a new SemanticMessage for the new reply. If #shouldStream is set to true, the answer will be SemanticStreamingMessage that is completed in the background."

	| stream chatCompletion |
	chatCompletion := self
		invokeWithConfig: aConfigOrNil
		editInput: [:input :config |
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
				[^ self handleStreamingReplyFor: aConversation from: response config: config]].
	
	^ self parseMessageFrom: chatCompletion