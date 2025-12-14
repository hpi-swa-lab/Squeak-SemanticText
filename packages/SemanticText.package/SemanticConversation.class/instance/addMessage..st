accessing - messages
addMessage: aMessage

	aMessage conversation: self.
	messages add: aMessage.
	self triggerEvent: #newMessage with: aMessage.
	^ aMessage