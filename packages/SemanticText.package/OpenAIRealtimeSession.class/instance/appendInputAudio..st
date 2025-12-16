requests
appendInputAudio: samples

	samples ifEmpty: [^ self].
	
	self flag: #optimize. "trim unused old part of inputAudioSamples? (~5 MB/min)"
	(inputAudioSamples ifNil: [inputAudioSamples := SemanticSoundSampleCollection new])
		addAll: samples.
	self sendAppendInputAudioBuffer:
		(SampledSound samples: samples samplingRate: self inputSamplingRate).
	
	streamingInputAudioMessages ifNotNil: [:messages |
		messages do: [:message |
			message addSoundChunk: samples]].