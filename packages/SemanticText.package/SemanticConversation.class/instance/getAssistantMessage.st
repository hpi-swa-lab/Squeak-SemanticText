assistant
getAssistantMessage
	"Retrieve a new assistant message from the model, append it to the receiver, and answer it."

	| response |
	response := self popToolSpecDuring:
		[self model getAnswerFor: self config: config].
	self addMessage: response.
	^ response