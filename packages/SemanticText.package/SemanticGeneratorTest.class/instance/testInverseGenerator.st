tests
testInverseGenerator

	| done generator |
	done := false.
	generator := self classToBeTested semanticOnConsumer: [:gen |
		self assert: 1 equals: gen next.
		self assert: #(2 3) equals: (gen next: 2) asArray.
		done := true].
	1 to: 3 do: [:ea |
		generator nextPut: ea].
	generator semanticCloseProducer.
	self assert: done.