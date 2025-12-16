public requests
stopListening

	self shouldListenContinuously
		ifFalse:
			[self isListening ifTrue:
				[self skipCurrentMessage]]
		ifTrue:
			[self stopListenerProcess].