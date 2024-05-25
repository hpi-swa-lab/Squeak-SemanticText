converting
distributeBulkToShares: shares

	| fractions |
	fractions := shares / shares sum.
	self assert: (fractions sum closeTo: 1).
	^ fractions collect: [:fraction |
		(self * fraction)
			bulkAmount: self;
			yourself]