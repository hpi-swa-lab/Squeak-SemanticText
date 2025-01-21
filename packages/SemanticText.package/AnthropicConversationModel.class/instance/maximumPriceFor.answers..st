pricing
maximumPriceFor: aConversation answers: number
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by Anthropic. Token counts are (upper) approximations."

	^ self
		priceFor: aConversation
		answers: number
		completionSize: nil