private - requests
parseAudioFrom: audio into: aMessage

	| transcript sound |
	(transcript := audio transcript) ifNotNil:
		[self assert: aMessage content isNil.
		aMessage content: transcript].
	
	audio data ifNotNil: [:data |
		| soundData |
		soundData := data semanticBase64DecodedAsByteArray.
		sound := SampledSound
			samples: (SampledSound convertBytesTo16BitSamples: soundData mostSignificantByteFirst: false)
			samplingRate: 24000.
		aMessage contentParts: (aMessage contentParts copyWithFirst: sound)].
	
	aMessage propertyValueAt: #audio put:
		(Dictionary new
			at: #id put: audio id;
			at: #transcript put: transcript; "strong reference because strings are frequently copied during parsing"
			at: #sound put: (WeakArray with: sound); "weak reference to avoid redundant memory consumption for validation"
			at: #expirationDate put: (DateAndTime fromUnixTime: (audio at: #'expires_at'));
			yourself).