preferences
defaultAccountUsageTier: tierOrString

	(tierOrString isString and: [tierOrString isSymbol not]) ifTrue:
		[| tier |
		tier := tierOrString
			ifEmpty: [nil]
			ifNotEmpty:
				[[(tierOrString beginsWith: '#')
					ifTrue: [tierOrString allButFirst asSymbol]
					ifFalse: [tierOrString asNumber]]
						ifError: [^ self inform: 'Invalid usage tier!']].
		(tier isNil or: [self isValidUsageTier: tier]) ifFalse: [^ self inform: 'Invalid usage tier!'].
		^ self defaultAccountUsageTier: tier].
	
	self assert: (tierOrString isNil or: [self isValidUsageTier: tierOrString]).
	self defaultAccount usageTier: tierOrString.