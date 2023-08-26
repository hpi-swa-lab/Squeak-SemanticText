preferences
defaultAccountSubscriptionState: aSymbol

	aSymbol isSymbol not ifTrue:
		[^ self defaultAccountSubscriptionState:
			((aSymbol beginsWith: '#')
				ifTrue: [aSymbol allButFirst]
				ifFalse: [aSymbol]) asSymbol].
	
	(self allSubscriptionStates includes: aSymbol) ifFalse: [^ self inform: ('Must be one of {1}' format: {self allSubscriptionStates asCommaStringAnd})].
	self defaultAccount subscriptionState: aSymbol.