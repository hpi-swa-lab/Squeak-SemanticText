private - events
sendClientEvent: type with: json

	| event |
	event := json.
	self assert: event type isNil.
	event type: type.
	event event_id: (event event_id ifNil: [self makeNewEventId]).
	
	self basicSendClientEvent: event.
	^ event