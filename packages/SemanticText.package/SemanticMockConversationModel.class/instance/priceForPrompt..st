pricing
priceForPrompt: aString

	self flag: #workaround. "Mock model MUST NOT depend on OpenAI provider!"
	^ OpenAIAmount exactCents: 0