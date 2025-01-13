accessing - expenses
noteExpense: expense forUser: userName model: modelName

	| expensesPerModel |
	expensesPerModel := expensesPerUser at: userName ifAbsentPut: [Dictionary new].
	expensesPerModel at: modelName put:
		(expensesPerModel at: modelName ifAbsent: [OpenAIAmount zero])
			+ expense.