pricing
priceFor: aString

	^ self isBilledPerCharacter
		ifTrue:
			[(OpenAIAmount exactCents: self centsPerCharacter)
				* aString size]
		ifFalse:
			[(OpenAIAmount approximateCents: self centsPerInputToken)
				* (self countTokensIn: aString)
					+
				(OpenAIAmount approximateCents: self centsPerOutputAudioToken)
					* (self maxAudioOutputTokensForStringOfSize: aString size)]