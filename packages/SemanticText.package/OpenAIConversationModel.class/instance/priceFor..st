pricing
priceFor: aConversation

	| priceForCompletion priceForPrompt |
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* (self countTokensInConversation: aConversation).
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* self maxTokens "this is really an upper approximation".
	^ priceForPrompt + priceForCompletion