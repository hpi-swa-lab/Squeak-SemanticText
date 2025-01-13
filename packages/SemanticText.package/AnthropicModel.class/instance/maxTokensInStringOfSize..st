service
maxTokensInStringOfSize: stringSize

	stringSize = 1 ifTrue: [^ 1].
	^ stringSize // 2