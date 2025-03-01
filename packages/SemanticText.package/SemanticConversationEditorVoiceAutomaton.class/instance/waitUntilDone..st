private
waitUntilDone: aSound

	[[aSound isPlaying] whileTrue: [0.1 seconds wait]]
		ifCurtailed:
			[self voiceState: nil.
			aSound stopGracefully].