pricing
priceFor: aConversation answers: number completionSize: completionSize
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	| priceForCompletion priceForPrompt |
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* (self countTokensInConversation: aConversation).
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* (self maxTokensInStringOfSize: completionSize). "upper approximation, see OpenAIModel>>#countTokensIn:"
	^ priceForPrompt + (priceForCompletion * number)