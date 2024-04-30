accessing
estimateTotalExpense

	^ ((self messages collect: [:message | message estimateExpense])
		copyWithout: nil)
			ifEmpty: [nil]
			ifNotEmpty: [:expenses | expenses sum]