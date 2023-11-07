accessing
text: aText

	self conversation messages: (self messagesFromText: aText) asOrderedCollection.
	self changed: #text.