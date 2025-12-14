service
maxTokensInAudioOfDuration: aDuration

	^ self maxTokensInStringOfSize:
		(self maxCharactersInAudioOfDuration: aDuration)