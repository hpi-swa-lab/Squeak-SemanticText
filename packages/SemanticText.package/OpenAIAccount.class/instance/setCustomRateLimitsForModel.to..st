accessing - rate limits
setCustomRateLimitsForModel: modelName to: rateLimitsSpec
	"rateLimitsSpec: {requestsPerMinute. requestsPerDay. tokensPerMinute. tokensPerDay}
	See: https://platform.openai.com/account/limits. Hypothetically we could scrape this, in practice, users may enter relevant rate limits manually."

	self customRateLimits at: modelName put:
		(self class rateLimitsFromSpec: rateLimitsSpec).