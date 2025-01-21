private - requests
parseMessagesFrom: messageCompletion for: aConversation logRawOutput: logRawOutput

	| message messages |

	message := self parseMessageFrom: messageCompletion
		for: aConversation
		logRawOutput: logRawOutput.
	
	messages := {message}.
	messageCompletion usage ifNotNil: [:usage |
		| expense |
		expense := self expenseForUsage: usage.
		self assignExpense: expense toMessages: messages].
	
	^ messages