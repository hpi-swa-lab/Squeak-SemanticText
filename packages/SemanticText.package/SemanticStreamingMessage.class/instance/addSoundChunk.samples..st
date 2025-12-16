streaming
addSoundChunk: aSampledSound samples: samples

	| initAudio audioSampleStart |
	self assert: (self contentParts identityIncludes: aSampledSound).
	
	initAudio := aSampledSound samples isNil.
	audioSampleStart := initAudio ifTrue: [1] ifFalse: [aSampledSound samples size + 1].
	aSampledSound openAIAddSamples: samples.
	initAudio ifTrue:
		[aSampledSound reset].
	
	audioSampleStart ifNotNil:
		[self addedSoundChunk: aSampledSound at: audioSampleStart].