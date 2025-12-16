accessing
isSpeaking: aBoolean

	self voiceState:
		(self isListeningContinuously
			ifFalse:
				[aBoolean ifTrue: [#speaking]]
			ifTrue:
				[aBoolean ifTrue: [#listeningAndSpeaking] ifFalse: [#listening]]).