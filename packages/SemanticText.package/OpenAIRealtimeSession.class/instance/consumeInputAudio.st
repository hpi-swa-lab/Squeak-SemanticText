private - input audio
consumeInputAudio

	| samples |
	samples := inputAudioSamples allButFirst: inputAudioConsumptionIndex.
	self clearInputAudioSamples.
	^ samples