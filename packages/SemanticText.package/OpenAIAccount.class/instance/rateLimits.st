accessing - rate limits
rateLimits

	| rateLimits |
	rateLimits := self defaultRateLimits copy.
	"merge"
	self customRateLimits keysAndValuesDo: [:modelName :modelLimit |
		rateLimits at: modelName put:
			(rateLimits
				at: modelName
				ifPresent: [:defaultModelLimit |
					defaultModelLimit , modelLimit])].
	^ rateLimits