public requests
stopListening

	self currentMessageName = #listen ifTrue:
		[self skipCurrentMessage].