accessing
voiceModeEnabled: aBoolean

	self voiceModeEnabled = aBoolean ifTrue: [^ self].
	
	voiceModeEnabled := aBoolean.
	self changed: #voiceModeEnabled.
	
	self voiceModeEnabled
		ifTrue: [self voiceAutomaton startListening]
		ifFalse: [self voiceAutomaton stopVoice].