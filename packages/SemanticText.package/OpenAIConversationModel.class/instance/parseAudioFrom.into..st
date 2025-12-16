private - requests
parseAudioFrom: audio into: aMessage

	| transcript sound |
	(transcript := audio transcript) ifNotNil:
		[self assert: aMessage content isNil.
		aMessage content: transcript].
	
	audio data ifNotNil: [:data |
		sound := SampledSound
			samples: (self parseAudioSamplesFrom: data soundClass: SampledSound)
			samplingRate: self audioOutputSamplingRate.
		aMessage contentParts: (aMessage contentParts copyWithFirst: sound)].
	
	aMessage propertyValueAt: #audio put:
		(Dictionary new
			at: #id put: audio id;
			at: #transcript put: transcript; "strong reference because strings are frequently copied during parsing"
			at: #sound put: (WeakArray with: sound); "weak reference to avoid redundant memory consumption for validation"
			at: #expirationDate put: (DateAndTime fromUnixTime: (audio at: #'expires_at'));
			yourself).