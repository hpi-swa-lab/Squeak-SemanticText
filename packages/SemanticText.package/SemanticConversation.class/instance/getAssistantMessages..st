assistant
getAssistantMessages: number

	| responses |
	responses := self model getAnswers: number for: self config: config.
	^ responses collect: [:response |
		self flag: #todo. "provide copied conversations in answer?"
		self copy addMessage: response.
		response]