pricing
priceFor: aConversation answers: number completionSize: completionSizeOrNil
	"If completionSizeOrNil is nil, the maximum possible size will be assumed.
	Note: Prices are hardcoded and might not encompass any recent pricing updates by Anthropic. Token counts are (upper) approximations."

	| promptTokens completionTokens priceForPrompt priceForCompletion |
	promptTokens := aConversation estimatePromptTokens.
	completionTokens := aConversation maxCompletionTokens. "this is indeed an upper approximation!"
	completionSizeOrNil ifNotNil:
		[completionTokens := completionTokens clampHigh: (self maxTokensInStringOfSize: completionSizeOrNil)].
	
	priceForPrompt := (OpenAIAmount approximateCents: self centsPerPromptToken)
		* promptTokens.
	priceForCompletion := (OpenAIAmount approximateCents: self centsPerCompletionToken)
		* completionTokens.
	^ priceForPrompt + (priceForCompletion * number)