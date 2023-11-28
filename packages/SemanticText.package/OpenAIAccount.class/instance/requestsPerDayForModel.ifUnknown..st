accessing - rate limits
requestsPerDayForModel: modelName ifUnknown: aBlock

	^ self rateLimitForModel: modelName type: #rpd ifUnknown: aBlock