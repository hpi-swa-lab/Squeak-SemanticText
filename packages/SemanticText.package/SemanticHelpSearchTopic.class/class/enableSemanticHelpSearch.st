preferences
enableSemanticHelpSearch
	<preference: 'Semantic search in help browsers (experimental)' category: #SemanticText description: 'Augment search results in help browsers with semantic search.' type: #Boolean>

	^ EnableSemanticHelpSearch ifNil: [false]