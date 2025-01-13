ui
openExpenseWatcher
	"For the actual usage without estimations, see: https://platform.openai.com/account/usage"

	| field inspector |
	inspector := Inspector on: self.
	field := inspector newCustomField valueGetter: [:account | account totalExpense].
	inspector addCustomField: field.
	field rememberInspector.
	^ (World dropInspectorField: field event: self currentEvent)
		in: [:answer |
			answer = World ifFalse: "Morphic-ct.2143"
				[answer openAsTool]]