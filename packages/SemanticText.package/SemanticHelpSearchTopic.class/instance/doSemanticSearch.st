searching
doSemanticSearch

	SemanticText assureSearchAvailableOr: [:requirements |
		searchRequirements := requirements.
		^ self triggerUpdateContents].
	
	resultTopics := self corpus findObjects: 20 similarToQuery: self term.
	self triggerUpdateContents.