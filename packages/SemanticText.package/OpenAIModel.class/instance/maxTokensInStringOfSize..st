service
maxTokensInStringOfSize: stringSize

	self flag: #approximation.
	stringSize = 1 ifTrue: [^ 1].
	^ stringSize // 2