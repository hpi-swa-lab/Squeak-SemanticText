completing
getAssistantMessageWithConfig: aConfigOrNil
	"Retrieve a new assistant message from the model, append it to the receiver, and return it.
	NB: The new message might contained unresolved tool calls. To automatically resolve and feed them back to the model, send #getCompleteAssistantMessage instead."

	| effectiveConfig response |
	self realtimeSession ifNotNil: [:session |
		^ self popToolSpecDuring: [session getResponseWithConfig: aConfigOrNil]].
	self supportsOnlyRealtimeSession ifTrue:
		[self startRealtimeSession.
		^ (self getAssistantMessageWithConfig: aConfigOrNil)
				when: #responseCompleted evaluate: [self stopRealtimeSession];
				yourself].
	
	self assert: self currentStreamingMessage isNil.
	
	effectiveConfig := self config.
	aConfigOrNil ifNotNil:
		[effectiveConfig := effectiveConfig updatedWith: aConfigOrNil].
	
	response := self popToolSpecDuring:
		[self model getAnswerFor: self config: effectiveConfig].
	self addMessage: response.
	^ response