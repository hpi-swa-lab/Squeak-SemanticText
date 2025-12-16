accessing
voiceActivityDetectionEnabled

	^ self conversation effectiveConfig shouldDetectVoiceActivity ifNil: [false]