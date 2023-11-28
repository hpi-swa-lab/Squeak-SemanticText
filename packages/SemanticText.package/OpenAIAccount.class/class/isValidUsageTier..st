constants
isValidUsageTier: tier

	^ tier = #free or:
		[tier isInteger and: [tier strictlyPositive]]