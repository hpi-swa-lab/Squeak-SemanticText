initialize-release
initialize

	super initialize.
	
	usageTier := self defaultUsageTier.
	customRateLimits := Dictionary new.
	self resetExpenses.