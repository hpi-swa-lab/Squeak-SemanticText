actions
addToolSpec

	| newToolSpec |
	newToolSpec := SemanticToolSpec new
		addTool:
			(SemanticFunction
				name: 'eval'
				description: 'Evaluates an expression'
				build: [:function |
					function addParameter: 'expression' description: 'A mathematical expression' type: #string required: true]);
		yourself.
	
	^ self addDo: [self textFromToolSpec: newToolSpec]