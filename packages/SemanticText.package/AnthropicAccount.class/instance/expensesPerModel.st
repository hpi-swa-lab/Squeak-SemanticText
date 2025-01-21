accessing - expenses
expensesPerModel

	| expensesPerModel |
	expensesPerModel := Dictionary new.
	self expensesPerUser keysAndValuesDo: [:user :expensePerModel |
		expensePerModel keysAndValuesDo: [:model :expense |
			(expensesPerModel at: model ifAbsentPut: [Dictionary new])
				at: user put: expense]].
	^ expensesPerModel