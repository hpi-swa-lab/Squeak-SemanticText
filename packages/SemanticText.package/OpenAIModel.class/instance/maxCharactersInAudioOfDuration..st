service
maxCharactersInAudioOfDuration: aDuration

	self flag: #approximation.
	^ (aDuration semanticFullSeconds clampLow: 1) * 30 "characters per second"