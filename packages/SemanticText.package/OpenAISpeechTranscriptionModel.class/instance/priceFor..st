pricing
priceFor: aSound

	^ (OpenAIAmount exactCents: self centsPerSecond)
		* aSound duration rounded