loop & scheduling
stopProcess

	process ifNil: [^ self].
	process terminate.
	process := nil.