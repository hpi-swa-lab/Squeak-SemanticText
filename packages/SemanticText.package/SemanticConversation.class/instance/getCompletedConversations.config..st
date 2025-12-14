completing
getCompletedConversations: number config: aConfigOrNil
	"Return <number> copies of the receiver, each completed with a new full assistant message retrieved from the model. If the assistant requests tool calls, these are automatically resolved and fed back to the model. No infinite loop protection!"

	| effectiveConfig responses conversations |
	effectiveConfig := self config.
	aConfigOrNil ifNotNil:
		[effectiveConfig := effectiveConfig updatedWith: aConfigOrNil].
	
	responses := self popToolSpecDuring:
		[self model getAnswers: number for: self config: effectiveConfig].
	conversations := responses collect: [:response |
		self copy
			addMessage: response;
			yourself].
	^ conversations semanticConcurrentCollect: [:ea |
		ea completeConversationAsIs: true config: aConfigOrNil]