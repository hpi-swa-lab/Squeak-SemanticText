loop & scheduling
stopListenerProcess

	listenerProcess ifNil: [^ self].
	listenerProcess terminate.
	listenerProcess := nil.