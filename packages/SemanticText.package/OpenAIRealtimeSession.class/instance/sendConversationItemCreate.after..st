client events
sendConversationItemCreate: aMessageOrToolCall after: previousMessage

	aMessageOrToolCall id ifNil: [aMessageOrToolCall id: self makeNewMessageId].
	^ self
		sendClientEvent: #'conversation.item.create'
		result: #'conversation.item.added' resultKey: aMessageOrToolCall id
		with:
			(JsonObject new
				item: aMessageOrToolCall asOpenAIRealtimeObject;
				previous_item_id:
					(previousMessage ifNil: [#root] ifNotNil:
						[previousMessage id ifNil: [previousMessage id: self makeNewMessageId; id]]);
				yourself)