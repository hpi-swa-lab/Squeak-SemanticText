service
maxCharactersInAudioOfDuration: aDuration

	self flag: #approximation.
	^ (aDuration fullSeconds clampLow: 1) * 30 "characters per second"