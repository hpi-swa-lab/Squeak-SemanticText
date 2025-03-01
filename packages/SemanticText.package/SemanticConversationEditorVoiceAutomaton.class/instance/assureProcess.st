loop & scheduling
assureProcess

	process ifNotNil: [^ self].
	process := [self runMessageLoop]
		forkAt: 50 named:
			('{1} for {2}' format: {self className. self conversation}).