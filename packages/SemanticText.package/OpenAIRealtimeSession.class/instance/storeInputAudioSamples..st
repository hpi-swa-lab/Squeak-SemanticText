private - input audio
storeInputAudioSamples: samples

	(inputAudioSamples ifNil:
		[inputAudioConsumptionIndex := 0.
		inputAudioSamples := SemanticSoundSampleCollection new])
			addAll: samples.
	
	streamingInputAudioMessages ifNotNil: [:messages |
		messages do: [:message |
			message addSoundChunk: samples]].