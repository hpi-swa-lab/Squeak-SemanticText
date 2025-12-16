server events - conversation items
handleConversationItemAdded: event
	<serverEvent: #'conversation.item.added'>

	| item |
	item := self conversationItemLike: event item.
	item ifNotNil:
		["ack only"
		self assertConversationItem: item equals: event item.
		self logEvent: event forItem: item.
		^ self triggerEvent: #'conversation.item.added' with: event item id].
	
	item := self parseMessageFrom: event item.
	self logEvent: event forItem: item.
	self addMessageFromServer: item.