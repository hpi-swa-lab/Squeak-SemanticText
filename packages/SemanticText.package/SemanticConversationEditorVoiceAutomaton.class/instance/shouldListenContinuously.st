accessing
shouldListenContinuously

	^ (self conversation ifNil: [^ false])
		effectiveConfig shouldDetectVoiceActivity ifNil: [false]