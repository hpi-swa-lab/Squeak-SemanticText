assistant
getAssistantMessage

	| response |
	response := self chatGPT getCompletionFor: self.
	self addMessage: response.
	^ response