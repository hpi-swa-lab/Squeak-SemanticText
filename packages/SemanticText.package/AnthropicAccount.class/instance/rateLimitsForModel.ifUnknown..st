accessing - rate limits
rateLimitsForModel: modelName ifUnknown: aBlock
	"See: https://platform.openai.com/account/rate-limits. Hypothetically we could scrape this, in practice, users may enter relevant rate limits manually."

	^ self rateLimits at: modelName ifAbsent:
		["search for rate limits for more general model name (prefix, e.g., without version number/context size)"
		| parts |
		parts := modelName ifNotEmpty: [modelName splitBy: '-'].
		parts ifNotEmpty:
			[^ self
				rateLimitsForModel: (parts allButLast joinSeparatedBy: '-')
				ifUnknown: aBlock].
		aBlock value]