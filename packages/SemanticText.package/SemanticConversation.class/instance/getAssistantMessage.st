assistant
getAssistantMessage

	| response |
	response := self model getAnswerFor: self config: config.
	self addMessage: response.
	^ response