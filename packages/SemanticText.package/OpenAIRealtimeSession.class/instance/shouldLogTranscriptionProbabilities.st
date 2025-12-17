private - configuration
shouldLogTranscriptionProbabilities

	^ ((self speechTranscriptionConfig ifNotNil: [:config | config shouldLogProbabilities])
		ifNil: [self config shouldLogProbabilities])
			ifNil: [false]