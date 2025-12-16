server events
handleUnknownServerEvent: event

	self halt: 'unknown server event type: ' , event type.
	^ self handleServerEvent: event