pricing
priceFor: aConversation
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	| priceForCompletion priceForPrompt |
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* (self countTokensInConversation: aConversation).
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* self maxTokens "this is really an upper approximation".
	^ priceForPrompt + priceForCompletion