pricing
pricePerMinute
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	^ (OpenAIAmount exactCents: self centsPerToken)
		* self tokensPerMinute