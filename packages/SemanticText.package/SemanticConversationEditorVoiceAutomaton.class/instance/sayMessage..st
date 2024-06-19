public requests
sayMessage: aMessage

	self assureProcess.
	self schedule: (MessageSend selector: #basicSayMessage: argument: aMessage).