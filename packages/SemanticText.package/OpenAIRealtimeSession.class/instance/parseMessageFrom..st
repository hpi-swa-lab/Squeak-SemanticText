parsing
parseMessageFrom: json

	| message |
	json type = 'function_call' ifTrue: [^ self parseFunctionCallMessageFrom: json].
	
	message := json type = 'function_call_output'
		ifTrue:
			[self assert: json status isNil.
			self assert: json status = 'completed'.
			SemanticToolMessage
				toolCall: (self functionCallWithKey: json call_id)
				content: json output]
		ifFalse:
			[| contentParts |
			self assert: json type = 'message'.
			contentParts := self parseContentPartsFrom: json content.
			self assert: (#('in_progress' 'completed') includes: json status).
			((json status = 'in_progress' or:
				[contentParts semanticAnyOverlappingPairSatisfy: [:first :second |
					first semanticIsSound and: [second = '']]])
						ifTrue: [SemanticStreamingMessage] ifFalse: [SemanticMessage])
							conversation: self conversation
							role: json role
							contentParts: contentParts].
	
	message id: json id.
	self shouldLogRawOutput ifTrue:
		[message rawOutput:
			(JsonObject new
				events: OrderedCollection new;
				yourself)].
	
	message isStreaming ifTrue:
		[self startSentinelProcessFor: message].
	^ message