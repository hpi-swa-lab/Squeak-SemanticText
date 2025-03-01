private
playAndWaitUntilDone: aSound

	self flag: #workaround. "AbstractSound>>#playAndWaitUntilDone exits too early"
	
	[aSound play.
	[aSound isPlaying] whileTrue: [0.1 seconds wait]]
		ifCurtailed:
			[self voiceState: nil.
			aSound stopGracefully].