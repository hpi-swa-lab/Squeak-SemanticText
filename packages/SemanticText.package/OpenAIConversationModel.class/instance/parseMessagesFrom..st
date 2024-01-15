private
parseMessagesFrom: chatCompletion

	^ chatCompletion choices collect: [:choice |
		self parseMessageFrom: choice]