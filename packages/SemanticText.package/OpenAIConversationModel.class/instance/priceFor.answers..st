pricing
priceFor: aConversation answers: number
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	| maxTokens |
	maxTokens := aConversation config maxTokens ifNil: [Float infinity].
	maxTokens := maxTokens clampHigh: self maxCompletionTokens.
	^ self
		priceFor: aConversation
		answers: number
		completionSize: (self maxCharactersInTokens: maxTokens)