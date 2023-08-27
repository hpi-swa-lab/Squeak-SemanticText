accessing
textSelection
	"Selection is only updating after cancelling or adding a new message."

	| editText |
	editText := self editText.
	^ editText size + 1 to: editText size