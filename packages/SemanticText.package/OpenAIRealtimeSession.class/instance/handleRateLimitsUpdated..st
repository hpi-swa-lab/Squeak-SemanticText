server events
handleRateLimitsUpdated: event
	<serverEvent: #'rate_limits.updated'>

	self flag: #todo.