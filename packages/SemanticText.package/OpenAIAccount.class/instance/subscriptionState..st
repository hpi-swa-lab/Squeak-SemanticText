accessing - subscription
subscriptionState: aSymbol

	self assert: (self class allSubscriptionStates includes: aSymbol).
	subscriptionState := aSymbol.