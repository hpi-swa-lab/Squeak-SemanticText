control
basicStop

	self unwatchConversation.
	self stopWebSocket.
	
	self triggerEvent: #stopped.