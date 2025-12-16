private - configuration
voiceSpeed

	^ (self config speechSynthesisConfigOrNil ifNotNil: [:config | config speed])
		ifNil: [1.0]