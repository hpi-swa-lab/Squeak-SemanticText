server events - conversation items
handleConversationItemDeleted: event
	<serverEvent: #'conversation.item.deleted'>

	| message |
	message := (self messageWithId: event item_id) ifNil:
		["ack only"
		^ self triggerEvent: #'conversation.item.deleted' with: event item_id].
	
	self logEvent: event forItem: message.
	self removeMessageFromServer: message.