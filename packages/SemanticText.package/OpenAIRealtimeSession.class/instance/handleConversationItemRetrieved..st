server events - conversation items
handleConversationItemRetrieved: event
	<serverEvent: #'conversation.item.retrieved'>

	| item |
	item := self parseConversationItemFrom: event item.
	self
		triggerEvent: #'conversation.item.retrieved'
		withArguments: {event item id. item}.