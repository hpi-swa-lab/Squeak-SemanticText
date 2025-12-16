private - conversation
removeMessageFromServer: aMessage

	self editMessagesFromServer:
		[self conversation messages: (self conversation messages copyWithout: aMessage)].
	^ aMessage