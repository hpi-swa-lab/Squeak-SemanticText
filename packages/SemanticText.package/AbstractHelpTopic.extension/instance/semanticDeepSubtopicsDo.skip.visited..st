*SemanticText-Tools-HelpSystemSearch-accessing
semanticDeepSubtopicsDo: aBlock skip: skipBlock visited: visited

	(visited ifAbsentAdd: self) ifFalse: [^ self].
	(skipBlock value: self) ifTrue: [^ self].
	aBlock value: self.
	self subtopics do: [:subtopic |
		subtopic semanticDeepSubtopicsDo: aBlock skip: skipBlock visited: visited].