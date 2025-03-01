private
basicSayMessage: aMessage

	| sound |
	self voiceState: #speaking.
	
	sound := self synthesize: aMessage.
	
	sound ifNotNil:
		[[self playAndWaitUntilDone: sound]
			ensure:
				[self voiceState: nil]].
	
	self basicDoneSayingMessage: aMessage.