positioning
skip: n

	(consumed atEnd and: [n >= 0]) ifFalse:
		[| limit |
		limit := consumed semanticReadLimit.
		consumed skip: (n clampHigh: limit).
		n > limit ifTrue: [super skip: limit - n].
		^ self].
	^ super skip: n