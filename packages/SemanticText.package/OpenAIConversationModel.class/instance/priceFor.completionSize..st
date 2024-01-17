pricing
priceFor: aConversation completionSize: completionSize
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	| priceForCompletion priceForPrompt |
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* (self countTokensInConversation: aConversation).
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* (completionSize / 2). "upper approximation, see OpenAIModel>>#countTokensIn:"
	^ priceForPrompt + priceForCompletion