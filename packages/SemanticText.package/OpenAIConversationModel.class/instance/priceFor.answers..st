pricing
priceFor: aConversation answers: number
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	^ self
		priceFor: aConversation
		answers: number
		completionSize: nil