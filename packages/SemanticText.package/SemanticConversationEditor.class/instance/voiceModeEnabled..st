accessing
voiceModeEnabled: aBoolean

	self voiceModeEnabled = aBoolean ifTrue: [^ self].
	
	aBoolean ifTrue:
		[self assureSpeechAvailableOr: [^ self]].
	
	voiceModeEnabled := aBoolean.
	self changed: #voiceModeEnabled.
	
	self voiceModeEnabled
		ifTrue: [self voiceAutomaton startListening]
		ifFalse: [self voiceAutomaton stopVoice].