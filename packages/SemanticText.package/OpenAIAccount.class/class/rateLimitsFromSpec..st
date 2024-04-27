support
rateLimitsFromSpec: spec
	"{requestsPerMinute. requestsPerDay. tokensPerMinute. tokensPerDay. batchQueueLimit}"

	^ (#(rpm rpd tpm tpd batchQueueLimit) with: spec collect: [:key :limit |
		key -> limit])
			asDictionary