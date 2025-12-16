loop & scheduling
assureProcess

	process ifNotNil: [^ self].
	process := [self runMessageLoop]
		forkAt: Processor highIOPriority named:
			('{1} for {2}' format: {self className. self conversation}).