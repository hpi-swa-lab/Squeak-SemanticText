accessing
next

	| result |
	consumed atEnd ifFalse: [^ consumed next].
	closed ifTrue: [^ nil].
	result := super next.
	result == closedToken ifTrue: [closed := true. ^ nil].
	^ consumed nextPut: result