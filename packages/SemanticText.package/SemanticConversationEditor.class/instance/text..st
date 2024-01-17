accessing
text: aText

	| messagesAndToolSpecs |
	messagesAndToolSpecs := self messagesAndToolSpecsFromText: aText.
	self conversation
		messages: messagesAndToolSpecs first asOrderedCollection;
		toolSpecs: messagesAndToolSpecs second.
	self changed: #text.