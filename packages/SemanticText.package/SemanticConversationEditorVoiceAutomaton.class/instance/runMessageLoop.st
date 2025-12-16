loop & scheduling
runMessageLoop

	[currentMessage := messages next.
	[self processMessage: currentMessage]
		ensure: [currentMessage := nil]]
			repeat.