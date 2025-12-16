functions
changeShapeNamed: name x: x y: y width: width height: height
	<function: changeShapeGeometry(
		name: string,
		centerX: {"type": "number", "minimum": 0, "maximum": 1},
		centerY: {"type": "number", "minimum": 0, "maximum": 1},
		width: {"type": "number", "minimum": 0, "maximum": 1},
		height: {"type": "number", "minimum": 0, "maximum": 1}
	)>

	| shape |
	shape := self shapes at: name.
	
	shape bounds:
		((((x @ y extent: width @ height)
			translateBy: width @ height / -2)
			scaleBy: self area extent)
				translateBy: self area position).
	
	^ true