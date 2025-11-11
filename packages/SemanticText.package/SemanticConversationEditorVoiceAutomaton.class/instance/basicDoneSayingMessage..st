private
basicDoneSayingMessage: aMessage

	((aMessage = self conversation lastMessage and: [self conversation hasPendingToolCalls not])
			and: [self shouldListen] and: [self shouldSpeak]) ifTrue:
		[self startListening].