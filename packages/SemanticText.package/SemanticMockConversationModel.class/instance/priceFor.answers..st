pricing
priceFor: aConversation answers: number

	self flag: #workaround. "Mock model MUST NOT depend on OpenAI provider!"
	^ OpenAIAmount exactCents: 0