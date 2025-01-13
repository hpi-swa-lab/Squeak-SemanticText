accessing - expenses
totalExpense

	^ self expensesPerUser inject: OpenAIAmount zero into: [:sum :expenses |
		expenses inject: OpenAIAmount zero into: [:userSum :expense | userSum + expense]]