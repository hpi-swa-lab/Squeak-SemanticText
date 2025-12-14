updating - conversation
updateConversationFromText

	self text: self editText.
	self conversation messages atLast: 1 ifPresent: [:message |
		message content ifNil:
			[self conversation messages removeLast.
			self changed: #text]].