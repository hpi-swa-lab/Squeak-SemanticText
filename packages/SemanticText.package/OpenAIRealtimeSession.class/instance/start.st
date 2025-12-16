control
start

	self stop.
	
	self startWebSocket.
	self addAllMessagesToSession.
	self addSystemInstructionsMessageFromServer.
	self watchConversation.