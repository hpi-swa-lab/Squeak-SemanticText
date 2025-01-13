accessing - expenses
totalExpensePerModel

	^ self expensesPerModel collect: [:expenses | expenses sum]