service
countAudioTokensInConversation: aConversation

	^ aConversation messages detectSum: [:message |
		self countAudioTokensInMessage: message]