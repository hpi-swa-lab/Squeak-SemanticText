accessing - rate limits
tokensPerMinuteForModel: modelName ifUnknown: aBlock

	| rateLimit |
	rateLimit := self rateLimitForModel: modelName ifUnknown: [^ aBlock value].
	^ rateLimit first