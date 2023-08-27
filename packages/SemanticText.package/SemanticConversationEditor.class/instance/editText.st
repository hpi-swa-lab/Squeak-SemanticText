private
editText
	"Answer the current text, including unaccepted changes."

	^ (self anyTextPaneWithSelector: #text) text