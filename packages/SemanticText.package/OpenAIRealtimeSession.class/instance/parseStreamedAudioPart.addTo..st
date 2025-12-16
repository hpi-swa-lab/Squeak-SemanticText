parsing
parseStreamedAudioPart: audioPart addTo: aStreamingMessage 

	| chunkText sound |
	aStreamingMessage contentParts
		detect: [:part | part semanticIsSound]
		ifFound: [:part | sound := part isThisEverCalled]
		ifNone:
			[sound := SampledSound samples: #() samplingRate: self outputSamplingRate.
			chunkText := sound semanticContentPartText.
			audioPart transcript ifNotNil: [chunkText := chunkText , String cr]].
	
	audioPart audio ifNotNil: [:audio |
		self parseStreamedAudioDelta: audio addTo: aStreamingMessage part: sound].
	
	audioPart transcript ifNotNil: [:transcript |
		chunkText := chunkText ifNil: [transcript] ifNotNil: [chunkText , transcript]].
	
	chunkText isEmptyOrNil ifFalse:
		[aStreamingMessage addChunk: chunkText].