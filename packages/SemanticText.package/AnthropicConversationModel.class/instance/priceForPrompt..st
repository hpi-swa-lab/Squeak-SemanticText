pricing
priceForPrompt: aString
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	^ (OpenAIAmount approximateCents: self centsPerPromptToken)
		* (self countTokensIn: aString)