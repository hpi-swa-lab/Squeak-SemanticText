tests
testInverseGeneratorWithError

	| done generator |
	self error: 'not yet working, would just raise an external debugger'; flag: #todo.
	
	done := false.
	generator := self classToBeTested semanticOnConsumer: [:gen |
		self assert: 1 equals: gen next.
		[self notify: 'boom!']
			ensure: [done := true]].
	generator nextPut: 1.
	self should: [generator nextPut: 2] raise: Warning.
	self assert: done.