pricing
priceFor: aConversation
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI."

	^ self
		priceFor: aConversation
		completionSize: self maxCompletionTokens * 2 "this is really an upper approximation"