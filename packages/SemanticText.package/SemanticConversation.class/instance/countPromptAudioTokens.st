accessing
countPromptAudioTokens

	^ self withNextActiveToolSpecDo:
		[self model countAudioTokensInConversation: self]