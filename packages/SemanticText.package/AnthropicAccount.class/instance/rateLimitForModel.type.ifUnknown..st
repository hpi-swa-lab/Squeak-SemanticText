accessing - rate limits
rateLimitForModel: modelName type: type ifUnknown: aBlock

	| rateLimit |
	rateLimit := self rateLimitsForModel: modelName ifUnknown: [^ aBlock value].
	^ rateLimit at: type ifAbsent: aBlock