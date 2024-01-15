private
parseMessagesFrom: chatCompletion logRawOutput: logRawOutput

	^ chatCompletion choices collect: [:choice |
		self
			parseMessageFrom: choice
			rawChatCompletion: (logRawOutput ifTrue: [chatCompletion])]