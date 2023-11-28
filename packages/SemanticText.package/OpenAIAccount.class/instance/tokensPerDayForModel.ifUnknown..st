accessing - rate limits
tokensPerDayForModel: modelName ifUnknown: aBlock

	^ self rateLimitForModel: modelName type: #tpd ifUnknown: aBlock