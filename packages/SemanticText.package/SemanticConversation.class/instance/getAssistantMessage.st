assistant
getAssistantMessage

	| response |
	response := self popToolSpecDuring:
		[self model getAnswerFor: self config: config].
	self addMessage: response.
	^ response