pricing
priceForPrompt: aString
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	^ (OpenAIAmount approximateCents: self centsPerPromptToken)
		* (self countTokensIn: aString)