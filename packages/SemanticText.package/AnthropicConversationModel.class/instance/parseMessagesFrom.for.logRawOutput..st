private - requests
parseMessagesFrom: chatCompletion for: aConversation logRawOutput: logRawOutput

	| messages |

	messages := 
		{self
			parseMessageFrom: chatCompletion
			for: aConversation
			logRawOutput: logRawOutput}.
	
	logRawOutput ifTrue:
		[messages do: [:message |
			message rawOutput: chatCompletion]].
	
	chatCompletion usage ifNotNil: [:usage |
		| expense |
		expense := self expenseForUsage: usage.
		self assignExpense: expense toMessages: messages].
	
	^ messages