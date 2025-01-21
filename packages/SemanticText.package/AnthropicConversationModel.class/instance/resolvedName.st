accessing
resolvedName

	self flag: #modelConstants.
	"Anthropic define '-latest' models directly, for which we already have definitions. No need to resolve anything."
	^ self name