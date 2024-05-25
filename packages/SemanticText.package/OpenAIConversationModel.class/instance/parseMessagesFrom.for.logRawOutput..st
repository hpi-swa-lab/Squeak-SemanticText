private - requests
parseMessagesFrom: chatCompletion for: aConversation logRawOutput: logRawOutput

	| messages |
	messages := chatCompletion choices collect: [:choice |
		self
			parseMessageFrom: choice
			for: aConversation
			logRawOutput: logRawOutput].
	
	logRawOutput ifTrue:
		[messages do: [:message |
			message rawOutput chatCompletion: chatCompletion]].
	
	chatCompletion usage ifNotNil: [:usage |
		| expense |
		expense := self expenseForUsage: usage.
		self assignExpense: expense toMessages: messages].
	
	^ messages