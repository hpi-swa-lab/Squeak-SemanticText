accessing
samplingRate

	^ self shouldTranscribe
		ifTrue: [self defaultSamplingRate]
		ifFalse: [self conversation model audioInputSamplingRate]