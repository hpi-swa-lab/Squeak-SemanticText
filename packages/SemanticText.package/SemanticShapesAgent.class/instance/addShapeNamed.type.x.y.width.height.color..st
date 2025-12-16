functions
addShapeNamed: name type: type x: x y: y width: width height: height color: color
	<function: addShape(
		name: string,
		type: {"enum": ["rectangle", "oval"]},
		centerX: {"type": "number", "minimum": 0, "maximum": 1},
		centerY: {"type": "number", "minimum": 0, "maximum": 1},
		width: {"type": "number", "minimum": 0, "maximum": 1},
		height: {"type": "number", "minimum": 0, "maximum": 1},
		color: string
	)>

	| shape |
	(self shapes includesKey: name) ifTrue: [^ self error: 'shape with this name already exists'].
	
	shape := Morph new.
	self shapes at: name put: shape.
	self
		changeShapeNamed: name type: type;
		changeShapeNamed: name x: x y: y width: width height: height;
		changeShapeNamed: name color: color.
	self area addMorph: shape.
	
	^ true