private
parseMessagesFrom: chatCompletion toolSpec: aToolSpecOrNil logRawOutput: logRawOutput

	^ chatCompletion choices collect: [:choice |
		self
			parseMessageFrom: choice
			toolSpec: aToolSpecOrNil
			rawChatCompletion: (logRawOutput ifTrue: [chatCompletion])]