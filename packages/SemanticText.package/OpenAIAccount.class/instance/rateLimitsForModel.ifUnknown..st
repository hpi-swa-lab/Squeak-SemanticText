accessing - rate limits
rateLimitsForModel: modelName ifUnknown: aBlock
	"See: https://platform.openai.com/account/rate-limits. Hypothetically we could scrape this, in practice, users may enter relevant rate limits manually."

	^ self rateLimits at: modelName ifAbsent: aBlock