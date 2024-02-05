private
nameForRateLimits

	({self class gpt4_0125Name. self class gpt4_1106Name} includes: self resolvedName) ifTrue: [^ self class gpt4TurboName].
	^ self resolvedName