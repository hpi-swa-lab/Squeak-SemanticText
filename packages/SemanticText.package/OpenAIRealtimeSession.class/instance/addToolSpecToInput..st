client events - private
addToolSpecToInput: input

	| toolSpec |
	toolSpec := self conversation activeToolSpec ifNil: [^ self].
	^ self
		addToolSpec: toolSpec
		toInput: input