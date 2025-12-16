parsing
parseFunctionCallMessageFrom: json

	| message functionCall |
	self assert: (#('in_progress' 'completed') includes: json status).
	message := (json status = 'in_progress' ifTrue: [SemanticStreamingMessage] ifFalse: [SemanticMessage])
		conversation: self conversation
		role: #assistant
		contentParts: #().
	message id: self makeNewMessageId.
	self shouldLogRawOutput ifTrue:
		[message rawOutput:
			(JsonObject new
				events: OrderedCollection new;
				yourself)].
	
	functionCall := self parseFunctionCallFrom: json.
	message isStreaming
		ifFalse: [message toolCalls: {functionCall}]
		ifTrue: [message addChunk: nil toolCalls: {functionCall} tokenProbabilities: nil].
	
	^ message