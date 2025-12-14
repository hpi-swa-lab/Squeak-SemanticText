accessing - expenses
estimatePromptTokens

	^ self withNextActiveToolSpecDo:
		[self model countTokensInConversation: self]