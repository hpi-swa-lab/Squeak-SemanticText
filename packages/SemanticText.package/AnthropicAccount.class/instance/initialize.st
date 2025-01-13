initialize-release
initialize

	super initialize.
	
	ignoreCertificate := false.
	usageTier := self defaultUsageTier.
	customRateLimits := Dictionary new.
	self resetExpenses.