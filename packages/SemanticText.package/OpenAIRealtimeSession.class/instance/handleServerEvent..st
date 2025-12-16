private - events
handleServerEvent: event

	eventLog ifNotNil: [eventLog addLast: event].
	existingIds add: event event_id.
	
	(self eventHandlerFor: event type)
		ifNotNil: [:handler | self perform: handler with: event]
		ifNil: [self handleUnknownServerEvent: event].