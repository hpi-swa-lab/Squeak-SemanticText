service
maxAudioTokensForStringOfSize: stringSize role: role

	| duration |
	self flag: #approximation.
	duration := (stringSize / 10 "characters per second") clampLow: 1 "second".
	^ (RestSound dur: duration)
		openAICountAudioTokensForRole: role