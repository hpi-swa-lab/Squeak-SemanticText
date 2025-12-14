accessing
nextOrNil

	consumed atEnd ifFalse: [^ consumed next].
	closed ifTrue: [^ nil].
	^monitor critical: [
		items isEmpty ifTrue: [ nil ] ifFalse:
			[ | result |
			result := items removeFirst.
			result == closedToken ifTrue: [closed := true. nil] ifFalse:
				[consumed nextPut: result] ] ]