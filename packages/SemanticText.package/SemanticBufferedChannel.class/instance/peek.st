accessing
peek

	| result |
	consumed atEnd ifFalse: [^ consumed peek].
	result := super peek.
	result == closedToken ifTrue: [^ nil].
	^ result