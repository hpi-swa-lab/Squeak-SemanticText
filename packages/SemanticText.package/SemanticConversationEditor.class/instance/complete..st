actions
complete: aText

	| response |
	self text: aText.
	
	response := self beBusyDuring:
		[self conversation getAssistantMessage].
	
	response isStreaming
		ifFalse:
			[self changed: #text.
			self addUserMessage]
		ifTrue:
			[self updateStreamingMessage].