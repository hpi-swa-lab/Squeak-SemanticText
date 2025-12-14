accessing - expenses
totalExpense

	^ ((self messages collect: [:message | message expense])
		copyWithout: nil)
			ifEmpty: [nil]
			ifNotEmpty: [:expenses | expenses sum]