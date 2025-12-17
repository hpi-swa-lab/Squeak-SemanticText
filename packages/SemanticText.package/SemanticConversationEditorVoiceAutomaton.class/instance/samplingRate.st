accessing
samplingRate

	^ (self shouldTranscribe ifFalse: [self conversation model audioInputSamplingRate])
		ifNil: [self defaultSamplingRate]