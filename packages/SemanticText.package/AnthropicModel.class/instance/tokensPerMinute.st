rate limits
tokensPerMinute

	^ self account tokensPerMinuteForModel: self nameForRateLimits ifUnknown: [nil]