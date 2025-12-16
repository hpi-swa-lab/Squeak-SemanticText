parsing
parseContentPartsForInputAudioFrom: json 

	^ Array streamContents: [:stream |
		stream nextPut:
			(SampledSound
				samples:
					(self model
						parseAudioSamplesFrom: (json audio ifNil: [''])
						soundClass: SampledSound)
				samplingRate: self inputSamplingRate).
		
		self shouldTranscribe
			ifTrue:
				[stream nextPut: (json transcript ifNil: [''])]
			ifFalse:
				[self assert: json transcript isEmptyOrNil]]