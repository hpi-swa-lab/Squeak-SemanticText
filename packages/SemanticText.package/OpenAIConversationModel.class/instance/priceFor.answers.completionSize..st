pricing
priceFor: aConversation answers: number completionSize: completionSizeOrNil
	"If completionSizeOrNil is nil, the maximum possible size will be assumed.
	Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	| promptTokens promptAudioTokens completionTokens completionAudioTokens priceForPrompt priceForCompletion |
	promptTokens := aConversation estimatePromptTokens.
	promptAudioTokens := aConversation countPromptAudioTokens.
	completionTokens := aConversation maxCompletionTokens. "this is indeed an upper approximation!"
	completionSizeOrNil ifNotNil:
		[completionTokens := completionTokens clampHigh: (self maxTokensInStringOfSize: completionSizeOrNil)].
	completionAudioTokens := completionSizeOrNil
		ifNil: [0 "already estimated in completionTokens via maxCompletionTokens"]
		ifNotNil: [self maxAudioOutputTokensForStringOfSize: completionSizeOrNil].
	
	priceForPrompt := self expenseForTokenSpecs:
		{promptTokens -> #centsPerPromptToken.
		promptAudioTokens -> #centsPerAudioPromptToken}.
	priceForCompletion := self expenseForTokenSpecs:
		{completionTokens -> #centsPerCompletionToken.
		completionAudioTokens -> #centsPerAudioCompletionToken}.
	
	^ priceForPrompt + (priceForCompletion * number)