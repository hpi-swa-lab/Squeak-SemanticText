actions
addToolSpec

	| newToolSpec |
	newToolSpec := SemanticToolSpec new
		addTool:
			(SemanticFunction
				name: 'eval'
				description: 'Evaluates an expression'
				build: [:function |
					function addParameter: 'expression' description: 'A mathematical expression' type: #string required: true]
				action: [:args | Compiler evaluate: args expression]);
		yourself.
	
	^ self addDo: [self textFromToolSpec: newToolSpec]