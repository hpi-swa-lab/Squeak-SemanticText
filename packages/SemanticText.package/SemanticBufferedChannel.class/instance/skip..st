positioning
skip: n

	(consumed atEnd and: [n >= 0]) ifFalse:
		[consumed skip: (n clampHigh: consumed readLimit).
		n > consumed readLimit ifTrue: [super skip: consumed readLimit - n].
		^ self].
	^ super skip: n