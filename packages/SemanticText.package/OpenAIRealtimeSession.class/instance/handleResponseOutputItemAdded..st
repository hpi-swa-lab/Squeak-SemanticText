server events - responses
handleResponseOutputItemAdded: event
	<serverEvent: #'response.output_item.added'>

	| message |
	message := self parseMessageFrom: event item.
	self logEvent: event forItem: message.
	self addMessageFromServer: message.
	self triggerEvent: #newResponseMessage withArguments: {event response_id. message}.