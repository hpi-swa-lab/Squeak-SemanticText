parsing
parseFunctionCallFrom: json

	| userMessage functionCall |
	self assert: (#('in_progress' 'completed') includes: json status).
	functionCall := (json status = 'in_progress' ifTrue: [SemanticStreamingToolCall] ifFalse: [SemanticToolCall])
		key: json call_id
		tool: json name
		parseArguments: json arguments.
	functionCall id: json id.
	
	userMessage := self conversation messages reversed
		detect: [:ea | ea isUserMessage]
		ifNone: [nil].
	(self conversation effectiveToolSpecFor: userMessage) ifNotNil: [:toolSpec |
		toolSpec toolNamed: functionCall tool ifPresent: [:tool |
			functionCall tool: tool.
			functionCall isStreaming ifTrue:
				[functionCall startStreaming]]].
	
	^ functionCall