accessing
defaultVoiceName

	^ self shouldSynthesize
		ifFalse: [self conversation model defaultVoice]
		ifTrue: [self speechSynthesisModel defaultVoice]