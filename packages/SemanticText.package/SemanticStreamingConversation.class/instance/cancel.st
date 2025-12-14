streaming
cancel

	self isComplete ifTrue: [^ self].
	process ifNil: [^ self].
	process terminate. "this will send #beComplete via #ensure:"
	process := nil.