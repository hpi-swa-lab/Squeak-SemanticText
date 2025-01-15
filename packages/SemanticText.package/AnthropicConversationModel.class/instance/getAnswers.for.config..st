service
getAnswers: number for: aConversation config: aConfigOrNil
	"Generate <number> assistant replies in response to aConversation. Answer a collection of new SemanticMessages for each new reply. If #shouldStream is set to true, the answers will be SemanticStreamingMessages that are completed in the background."

	| chatCompletion logRawOutput stream resumeStream |
	
	"Multiple responses via `n` are not directly supported by the Anthropic API"
	number > 1 ifTrue: [
		^ ((1 to: number) collect: [:i | self getAnswers: 1 for: aConversation config: aConfigOrNil]) flattened].
	
	chatCompletion := self
		invokeWithConfig: aConfigOrNil
		editInput: [:input :config |
			config user ifNotNil: [:user |
				input user: user].
			
			config maxTokens ifNotNil: [:maxTokens |
				input max_tokens: maxTokens].
			
			config temperature ifNotNil: [:temperature |
				input temperature: temperature].
			
			config nucleusSamplingMass ifNotNil: [:p |
				input top_p: p].
			
			config topKSampling ifNotNil: [:k |
				input top_k: k].
			
			logRawOutput := false.
			config shouldLogRawOutput ifNotNil: [:shouldLogRawOutput |
				logRawOutput := shouldLogRawOutput].
			
			stream := false.
			config shouldStream ifNotNil: [:shouldStream |
				stream := shouldStream.
				input stream: stream].
			
			aConversation messages first role = 'system' ifTrue: [
				input system: (aConversation messages first content)].
			
			input messages:
				(aConversation messages
					"System messages are specified on the top-level `input.system` field"
					select: [:message | message role ~= 'system']
					thenCollect: [:message | message asAnthropicObject]).
			
			aConversation activeToolSpec ifNotNil: [:toolSpec |
				self addToolSpec: toolSpec toInput: input].
			
			(stream and: [self shouldStreamRequests]) ifTrue:
				["For faster feedback, send even the request asynchronously."
				^ self handleAsyncReplies: number for: aConversation config: config  logRawOutput: logRawOutput deferStreaming:
					[:resumeBlock | resumeStream := resumeBlock]]]
		handleResponse: [:response :config |
			(stream and: [response isSuccess]) ifTrue:
				[resumeStream ifNotNil: [resumeStream value: response].
				^ self handleStreamingReplies: number for: aConversation from: response config: config logRawOutput: logRawOutput]].
	
	^ self parseMessagesFrom: chatCompletion for: aConversation logRawOutput: logRawOutput