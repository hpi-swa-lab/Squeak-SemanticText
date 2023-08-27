pricing
priceForAll: strings
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	^ (OpenAIAmount approximateCents: self centsPerToken)
		* (strings detectSum: [:string | self countTokensIn: string])