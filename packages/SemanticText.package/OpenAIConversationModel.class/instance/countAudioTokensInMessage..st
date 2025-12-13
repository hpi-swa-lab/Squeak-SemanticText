private - tokens
countAudioTokensInMessage: aMessage

	^ (aMessage contentParts select: [:part | part semanticIsSound])
		detectSum: [:part | part openAICountAudioTokensForRole: aMessage role]