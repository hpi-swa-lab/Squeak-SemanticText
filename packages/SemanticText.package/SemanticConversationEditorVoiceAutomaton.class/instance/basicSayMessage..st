private
basicSayMessage: aMessage

	| sound |
	self isSpeaking: true.
	
	sound := self synthesize: aMessage.
	
	sound ifNotNil:
		[[self playAndWaitUntilDone: sound]
			ensure:
				[self isSpeaking: false]].
	
	self basicDoneSayingMessage: aMessage.