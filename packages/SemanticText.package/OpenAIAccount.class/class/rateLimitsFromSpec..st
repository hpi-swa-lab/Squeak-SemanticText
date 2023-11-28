support
rateLimitsFromSpec: spec
	"{requestsPerMinute. requestsPerDay. tokensPerMinute. tokensPerDay}"

	^ (#(rpm rpd tpm tpd) with: spec collect: [:key :limit |
		key -> limit])
			asDictionary