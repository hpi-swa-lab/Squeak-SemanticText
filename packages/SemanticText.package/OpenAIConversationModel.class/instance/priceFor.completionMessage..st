pricing
priceFor: aConversation completionMessage: aMessage
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	| promptTokens completionTokens priceForPrompt priceForCompletion |
	promptTokens := aConversation estimatePromptTokens.
	completionTokens := self countTokensInMessage: aMessage.
	
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* promptTokens.
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* completionTokens.
	^ priceForPrompt + priceForCompletion