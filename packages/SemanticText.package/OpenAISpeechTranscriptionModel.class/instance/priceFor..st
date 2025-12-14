pricing
priceFor: aSound

	^ self isBilledPerSecond
		ifTrue:
			[(OpenAIAmount exactCents: self centsPerSecond)
				* aSound duration rounded]
		ifFalse:
			[(OpenAIAmount exactCents: self centsPerAudioToken)
				* aSound openAICountAudioTokensForInput
					+
				(OpenAIAmount approximateCents: self centsPerOutputTextToken)
					* (self maxTokensInAudioOfDuration: aSound duration seconds)]