support
rateLimitsFromSpec: spec
	"{requestsPerMinute. requestsPerDay. tokensPerMinute. tokensPerDay. batchQueueLimit[. requestsPerMinuteLongContext. tokensPerMinuteLongContext. batchQueueLimitLongContext]}"

	| keys |
	keys := #(rpm rpd tpm tpd batchQueueLimit).
	spec size = 8 ifTrue: [keys := keys , #(rpmLongContext tpmLongContext batchQueueLimitLongContext)].
	^ (keys with: spec collect: [:key :limit |
		key -> limit])
			as: Dictionary