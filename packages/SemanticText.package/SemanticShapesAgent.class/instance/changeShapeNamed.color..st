functions
changeShapeNamed: name color: color
	<function: changeShapeColor(
		name: string,
		color: string
	)>

	| shape |
	shape := self shapes at: name.
	
	shape color:
		(Color fromString: color).
	
	^ true