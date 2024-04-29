accessing
estimatePromptTokens

	^ self withNextActiveToolSpecDo:
		[self model countTokensInConversation: self]