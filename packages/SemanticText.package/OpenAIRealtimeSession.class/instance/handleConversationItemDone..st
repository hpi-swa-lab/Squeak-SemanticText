server events - conversation items
handleConversationItemDone: event
	<serverEvent: #'conversation.item.done'>

	| item |
	item := self conversationItemLike: event item.
	self logEvent: event forItem: item.
	((item respondsTo: #role) and: [item role = #user])
		ifTrue:
			["audio input streaming might be in progress"]
		ifFalse:
			[(item isStreaming and: [item isComplete not]) ifTrue:
				[item beComplete]].