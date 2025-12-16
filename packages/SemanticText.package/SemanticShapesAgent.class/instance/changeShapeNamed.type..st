functions
changeShapeNamed: name type: type
	<function: changeShapeType(
		name: string,
		type: {"enum": ["rectangle", "oval"]}
	)>

	| shape |
	shape := self shapes at: name.
	
	shape becomeForward:
		(shape as:
			(type caseOf:
				{[#rectangle] -> [RectangleMorph].
				[#oval] -> [EllipseMorph]})).
	
	^ true