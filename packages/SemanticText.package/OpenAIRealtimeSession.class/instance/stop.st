control
stop

	self unwatchConversation.
	process ifNotNil:
		[process terminate.
		process := nil].
	self stopWebSocket.
	
	self triggerEvent: #stopped.