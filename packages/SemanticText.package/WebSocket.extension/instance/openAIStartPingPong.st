*SemanticText-Providers-OpenAI-support
openAIStartPingPong

	| interval pingProcess pingSemaphore timeout |
	interval := 1 seconds.
	timeout := 30 seconds.
	
	pingSemaphore := Semaphore new.
	pingProcess :=
		[[self ping: DateAndTime millisecondClock asString.
		[pingSemaphore wait] valueWithin: timeout onTimeout:
			[self close].
		interval wait]
			repeat]
				forkAt: Processor lowIOPriority named: ('{1}''s heartbeat' format: {self}).
	
	self onPong: [:data |
		pingSemaphore signal].
	
	^ pingProcess