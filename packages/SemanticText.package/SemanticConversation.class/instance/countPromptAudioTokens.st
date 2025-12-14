accessing - expenses
countPromptAudioTokens

	^ self withNextActiveToolSpecDo:
		[self model countAudioTokensInConversation: self]