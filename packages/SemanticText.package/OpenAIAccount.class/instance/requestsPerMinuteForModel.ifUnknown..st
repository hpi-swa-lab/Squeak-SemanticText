accessing - rate limits
requestsPerMinuteForModel: modelName ifUnknown: aBlock

	^ self rateLimitForModel: modelName type: #rpm ifUnknown: aBlock