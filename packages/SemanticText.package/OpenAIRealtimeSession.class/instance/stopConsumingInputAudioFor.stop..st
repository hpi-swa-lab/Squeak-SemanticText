private - input audio
stopConsumingInputAudioFor: aMessage stop: stop

	streamingInputAudioMessages remove: aMessage.
	inputAudioConsumptionIndex := (stop * self inputSamplingRate) floor.
	
	self flag: #optimize. "trim unused old part of inputAudioSamples? (~5 MB/min)"