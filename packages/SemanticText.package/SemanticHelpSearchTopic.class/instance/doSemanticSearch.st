searching
doSemanticSearch

	resultTopics := self corpus findObjects: 20 similarToQuery: self term.
	self triggerUpdateContents.