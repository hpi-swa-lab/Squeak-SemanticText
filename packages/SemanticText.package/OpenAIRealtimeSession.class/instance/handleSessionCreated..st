server events
handleSessionCreated: event
	<serverEvent: #'session.created'>

	currentSessionProperties := event session.
	
	[self updateSession.
	self triggerEvent: #'session.created']
		forkAt: Processor activePriority.