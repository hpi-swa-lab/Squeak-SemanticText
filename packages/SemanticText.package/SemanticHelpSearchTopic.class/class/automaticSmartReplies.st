preferences
automaticSmartReplies
	<preference: 'Always generate smart replies for semantic help search (experimental)' category: #SemanticText description: 'Automatically agment search results in help browsers with an AI-generated answer to the query. When disabled, you can request a smart summary manually from the search results.' type: #Boolean>

	self enableSemanticHelpSearch ifFalse: [^ false].
	^ AutomaticSmartReplies ifNil: [false]