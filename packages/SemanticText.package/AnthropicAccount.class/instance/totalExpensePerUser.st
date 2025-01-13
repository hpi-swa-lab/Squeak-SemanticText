accessing - expenses
totalExpensePerUser

	^ self expensesPerUser collect: [:expenses | expenses sum]