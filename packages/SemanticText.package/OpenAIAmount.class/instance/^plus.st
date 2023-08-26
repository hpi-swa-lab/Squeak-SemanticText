arithmetic
+ anotherExpense

	^ self species
		exactCents: self exactCents + anotherExpense exactCents
		approximateCents: self approximateCents + anotherExpense approximateCents