*SemanticText-Tools-HelpSystemSearch-accessing-override
contents
	
	^self item subtopics sorted collect: [ :each | 
		each asHelpTopicListItemWrapperForModel: self model parent: self]
