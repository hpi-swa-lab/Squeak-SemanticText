private - configuration
voiceName

	^ (self config speechSynthesisConfigOrNil ifNotNil: [:config | config voice])
		ifNil: [self class allVoices anyOne]