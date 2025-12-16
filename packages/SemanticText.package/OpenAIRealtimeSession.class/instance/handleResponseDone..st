server events - responses
handleResponseDone: event
	<serverEvent: #'response.done'>

	currentResponses remove: event response id ifAbsent: ["wat?"].
	
	event response usage ifNotNil: [:usage |
		| messages expense |
		messages := event response output
			select: [:item | item role = 'assistant' or: [item type = 'function_call']]
			thenCollect: [:item |
				| message |
				message := self conversationItemLike: item.
				message isSemanticToolCall ifTrue:
					[message := self messageWithToolCall: message].
				message].
		expense := self expenseForUsage: usage.
		expense isZero "e.g. when cancelled" ifFalse:
			[self model assignExpense: expense toMessages: messages.
			self model account
				noteExpense: expense
				forUser: self config user
				model: self model name]].
	
	self triggerEvent: #'response.done' with: event response id.