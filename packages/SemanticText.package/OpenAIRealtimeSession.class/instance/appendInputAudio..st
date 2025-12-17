requests
appendInputAudio: samples

	samples ifEmpty: [^ self].
	
	self sendAppendInputAudioBuffer:
		(SampledSound samples: samples samplingRate: self inputSamplingRate).
	
	self storeInputAudioSamples: samples.