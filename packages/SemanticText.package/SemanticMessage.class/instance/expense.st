accessing
expense

	^ expense ifNil: [self estimateExpense]