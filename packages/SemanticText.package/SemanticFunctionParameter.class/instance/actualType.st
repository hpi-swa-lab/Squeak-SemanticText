accessing
actualType

	self type isDictionary ifTrue: [^ self type type].
	^ self type