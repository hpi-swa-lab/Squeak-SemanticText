accessing
text: aText

	self conversation messages: (self messagesFromText: aText).
	self changed: #text.