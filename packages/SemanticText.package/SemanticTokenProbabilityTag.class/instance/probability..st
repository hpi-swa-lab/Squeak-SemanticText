accessing
probability: aNumber

	self logprob:
		(aNumber > 0
			ifTrue: [aNumber ln]
			ifFalse: [Float negativeInfinity]).