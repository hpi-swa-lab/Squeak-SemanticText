pricing
priceFor: aConversation completionSize: completionSize
	"Note: Prices are hardcoded and might not encompass any recent pricing updates by OpenAI. Token counts are (upper) approximations."

	^ self
		priceFor: aConversation
		answers: 1
		completionSize: completionSize