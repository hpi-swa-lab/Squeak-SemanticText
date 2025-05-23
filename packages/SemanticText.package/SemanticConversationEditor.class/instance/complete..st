actions
complete: aText

	| response |
	self assureModelAvailableOr: [^ false].
	self voiceAutomaton stopListening.
	
	aText ifNotNil:
		[self text: aText].
	
	response := self beBusyDuring:
		[self conversation getAssistantMessage].
	
	response isStreaming
		ifFalse:
			[self changed: #text.
			self noteMessageCompleted: false]
		ifTrue:
			[self updateStreamingMessage].