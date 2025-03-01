private
playStatusSound: aSound

	| sound |
	sound := aSound play.
	
	[[sound millisecondsSinceStart / 1000 <= 0.3 "seconds"]
		whileTrue: [0.1 seconds wait]]
			ifCurtailed: [sound stopGracefully].
	SoundRecorder canRecordWhilePlaying ifFalse:
		[sound stopGracefully.
		[SoundPlayer isPlaying: sound] whileTrue: [0.05 seconds wait]].