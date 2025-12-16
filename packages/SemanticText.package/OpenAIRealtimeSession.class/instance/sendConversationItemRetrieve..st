client events
sendConversationItemRetrieve: id

	^ self
		sendClientEvent: #'conversation.item.retrieve'
		result: #'conversation.item.retrieved' resultKey: id
		with:
			(JsonObject new
				item_id: id;
				yourself)