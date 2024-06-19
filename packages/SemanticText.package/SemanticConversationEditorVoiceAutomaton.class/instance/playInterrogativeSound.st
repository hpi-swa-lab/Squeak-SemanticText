private
playInterrogativeSound

	| sound |
	sound := self interrogativeSound play.
	
	[[sound millisecondsSinceStart / 1000 <= 0.5 "seconds"]
		whileTrue: [0.1 seconds wait]]
			ifCurtailed: [sound stopGracefully].