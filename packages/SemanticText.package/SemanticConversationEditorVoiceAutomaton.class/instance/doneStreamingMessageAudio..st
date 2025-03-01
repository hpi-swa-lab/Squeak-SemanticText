public requests
doneStreamingMessageAudio: aMessage

	self assureProcess.
	self schedule: (MessageSend selector: #basicDoneStreamingMessageAudio: arguments: {aMessage}).