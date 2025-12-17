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
			[messages
				ifEmpty: [RemarkNotification signal: ('cannot attribute {1} to zero messages' format: {expense})]
				ifNotEmpty: [self model assignExpense: expense toMessages: messages].
			self model account
				noteExpense: expense
				forUser: self config user
				model: self model name]].
	
	event response status = #cancelled ifTrue:
		[self conversation triggerEvent: #responseCancelled with: event response id].
	
	self triggerEvent: #'response.done' with: event response id.