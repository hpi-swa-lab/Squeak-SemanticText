server events
handleSessionUpdated: event
	<serverEvent: #'session.updated'>

	currentSessionProperties := event session.
	self triggerEvent: #'session.updated'.