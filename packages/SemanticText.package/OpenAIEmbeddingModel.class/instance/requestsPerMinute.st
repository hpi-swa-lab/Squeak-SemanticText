rate limits
requestsPerMinute

	^ self account requestsPerMinuteForModel: self name ifUnknown:
		["See: https://platform.openai.com/docs/guides/rate-limits/what-are-the-rate-limits-for-our-api"
		self flag: #todo. "#hasLongTimeSubscription should probably be per actually used model? The docs are not clear on this."
		self flag: #modelConstants.
		true caseOf:
			{[self account isFreeUser] -> [3].
			[self account hasLongTimeSubscription not] -> [60].
			[self account hasLongTimeSubscription] -> [3500]}]