private - configuration
shouldLogTranscriptionProbabilities

	^ ((self config speechTranscriptionConfigOrNil ifNotNil: [:config | config shouldLogProbabilities])
		ifNil: [self config shouldLogProbabilities])
			ifNil: [false]