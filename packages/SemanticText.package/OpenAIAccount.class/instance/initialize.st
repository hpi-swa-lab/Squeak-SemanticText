initialize-release
initialize

	super initialize.
	
	self subscriptionState: self defaultSubscriptionState.
	rateLimits := Dictionary new.
	self resetExpenses.