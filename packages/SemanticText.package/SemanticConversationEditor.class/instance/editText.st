private
editText
	"Answer the current text, including unaccepted changes."

	^ (self anyTextPaneWithSelector: #text)
		ifNotNil: [:textPane | textPane text]
		ifNil: [self text]