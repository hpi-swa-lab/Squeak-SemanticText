pricing
priceFor: aConversation completionMessage: aMessage
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	| promptTokens promptAudioTokens completionTokens completionAudioTokens priceForPrompt priceForCompletion |
	promptTokens := aConversation estimatePromptTokens.
	promptAudioTokens := aConversation countPromptAudioTokens.
	completionTokens := self countTokensInMessage: aMessage.
	completionAudioTokens := self countAudioTokensInMessage: aMessage.
	
	priceForPrompt := self expenseForTokenSpecs:
		{promptTokens -> #centsPerPromptToken.
		promptAudioTokens -> #centsPerAudioPromptToken}.
	priceForCompletion := self expenseForTokenSpecs:
		{completionTokens -> #centsPerCompletionToken.
		completionAudioTokens -> #centsPerAudioCompletionToken}.
	
	^ priceForPrompt + priceForCompletion