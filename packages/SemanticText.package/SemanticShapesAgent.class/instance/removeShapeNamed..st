functions
removeShapeNamed: name
	<function: removeShape(
		name: string
	)>

	| shape |
	shape := self shapes removeKey: name.
	
	shape delete.
	
	^ true