accessing
addMessage: aMessage

	aMessage conversation: self.
	messages add: aMessage.
	^ aMessage