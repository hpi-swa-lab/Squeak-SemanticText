rate limits
tokensPerMinute

	^ self account tokensPerMinuteForModel: self name ifUnknown:
		["See: https://platform.openai.com/docs/guides/rate-limits/what-are-the-rate-limits-for-our-api"
		self flag: #todo. "#hasLongTimeSubscription should probably be per actually used model? The docs are not clear on this."
		self flag: #modelConstants.
		true caseOf:
			{[self account hasSubscription not] -> [150000].
			[self account hasLongTimeSubscription not] -> [250000].
			[self account hasLongTimeSubscription] -> [350000]}]