functions
removeShapeNamed: name
	<function: removeShape(
		name: string
	)>

	| shape |
	shape := self shapes at: name.
	
	shape delete.
	
	^ true