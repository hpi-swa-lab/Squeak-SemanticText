pricing
priceFor: aString

	^ (OpenAIAmount exactCents: self centsPerCharacter)
		* aString size