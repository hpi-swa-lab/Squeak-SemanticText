accessing - rate limits
requestsPerMinuteForModel: modelName ifUnknown: aBlock

	| rateLimit |
	rateLimit := self rateLimitForModel: modelName ifUnknown: [^ aBlock value].
	^ rateLimit first