preferences
enableSmartReplies
	<preference: 'Smart replies for semantic help search (experimental)' category: #SemanticText description: 'Augment search results in help browsers with an AI-generated answer to the query.' type: #Boolean>

	self enableSemanticHelpSearch ifFalse: [^ false].
	^ EnableSmartReplies ifNil: [true]