ui
openExpenseWatcher
	"For the actual usage without estimations, see: https://platform.openai.com/account/usage"

	| field inspector |
	inspector := Inspector on: self.
	field := inspector newCustomField valueGetter: [:account | account totalExpense].
	inspector addCustomField: field.
	World dropInspectorField: field event: self currentEvent.