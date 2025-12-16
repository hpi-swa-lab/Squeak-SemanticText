parsing
parseContentPartsForOutputAudioFrom: json

	^ Array with:
		(SampledSound
			samples:
				(self model
					parseAudioSamplesFrom: (json audio ifNil: [''])
					soundClass: SampledSound)
			samplingRate: self outputSamplingRate)