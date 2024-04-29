pricing
priceFor: aConversation answers: number completionSize: completionSizeOrNil
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	| promptTokens completionTokens priceForPrompt priceForCompletion |
	promptTokens := aConversation estimatePromptTokens.
	completionTokens := aConversation maxCompletionTokens. "upper approximation!"
	completionSizeOrNil ifNotNil:
		[completionTokens := completionTokens clampHigh: (self maxTokensInStringOfSize: completionSizeOrNil)].
	
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* promptTokens.
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* completionTokens.
	^ priceForPrompt + (priceForCompletion * number)