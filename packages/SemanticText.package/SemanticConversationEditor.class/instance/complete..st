actions
complete: aText

	| response |
	self assureModelAvailableOr: [^ false].
	
	aText ifNotNil:
		[self text: aText].
	
	response := self beBusyDuring:
		[self conversation getAssistantMessage].
	
	response isStreaming
		ifFalse:
			[self changed: #text.
			self noteMessageCompleted]
		ifTrue:
			[self updateStreamingMessage].