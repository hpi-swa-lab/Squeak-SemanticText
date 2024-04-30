copying
updateWith: anotherToolSpecOrNil

	anotherToolSpecOrNil ifNil: [^ self].
	
	self addTools: anotherToolSpecOrNil tools.
	anotherToolSpecOrNil forcedTools ifNotNil: [:forced |
		self forcedTools: forced].