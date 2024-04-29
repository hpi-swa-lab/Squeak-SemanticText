private - requests
parseMessagesFrom: chatCompletion for: aConversation logRawOutput: logRawOutput

	^ chatCompletion choices collect: [:choice |
		self
			parseMessageFrom: choice
			for: aConversation
			rawChatCompletion: (logRawOutput ifTrue: [chatCompletion])]