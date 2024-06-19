loop & scheduling
runMessageLoop

	[currentMessage := messages next.
	self processMessage: currentMessage.
	currentMessage := nil]
		repeat.