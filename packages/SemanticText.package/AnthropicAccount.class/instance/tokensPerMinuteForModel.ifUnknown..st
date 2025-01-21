accessing - rate limits
tokensPerMinuteForModel: modelName ifUnknown: aBlock

	^ self rateLimitForModel: modelName type: #tpm ifUnknown: aBlock