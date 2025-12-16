requests
addAllMessagesToSession

	self conversation messages do: [:ea |
		self addMessageToSession: ea].