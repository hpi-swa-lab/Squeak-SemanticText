testing
atEnd

	| result |
	consumed atEnd ifFalse: [^ false].
	closed ifTrue: [^ true].
	result := super next.
	result == closedToken ifTrue: [closed := true. ^ true].
	consumed nextPut: result.
	self skip: -1.
	^ false