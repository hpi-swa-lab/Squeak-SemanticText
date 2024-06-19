loop & scheduling
assureProcess

	process ifNotNil: [^ self].
	process := [self runMessageLoop] fork.