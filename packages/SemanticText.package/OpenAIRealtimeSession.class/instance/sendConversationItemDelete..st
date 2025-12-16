client events
sendConversationItemDelete: aMessageOrToolCalll

	self assert: aMessageOrToolCalll id notNil.
	^ self
		sendClientEvent: #'conversation.item.delete'
		result: #'conversation.item.deleted' resultKey: aMessageOrToolCalll id
		with:
			(JsonObject new
				item_id: aMessageOrToolCalll id;
				yourself)