ui
openExpenseWatcher

	| field inspector |
	inspector := Inspector on: self.
	field := inspector newCustomField valueGetter: [:account | account totalExpense].
	inspector addCustomField: field.
	World dropInspectorField: field event: self currentEvent.