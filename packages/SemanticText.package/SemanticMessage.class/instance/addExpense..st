accessing
addExpense: anObject

	self expense:
		(expense
			ifNil: [anObject]
			ifNotNil: [:existing | existing + anObject]).