*SemanticText-Tools-HelpSystemSearch-instance creation-override
new

	^ SemanticHelpSearchTopic enableSemanticHelpSearch
		ifTrue: [SemanticHelpSearchTopic new]
		ifFalse: [super new]