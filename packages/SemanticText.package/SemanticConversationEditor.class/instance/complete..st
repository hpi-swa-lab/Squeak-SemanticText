actions
complete: aText

	self assureModelAvailableOr: [^ false].
	
	self cancel.
	self voiceAutomaton isListening ifTrue:
		[self voiceAutomaton stopListening].
	self voiceModeEnabled ifTrue:
		[self voiceAutomaton voiceState: #transcribing "TODO (also above): shold not really be transcribing, just not nil so following saying works. NB: not thread-safe (new messages won't be said during temporary voiceState nil)"].
	
	aText ifNotNil:
		[self text: aText].
	
	
	self beBusyDuring:
		[self installToolCallResolver.
		self conversation completeConversation].
	
	self isStreamingResponse
		ifFalse:
			[self changed: #text.
			self noteMessageCompleted: self conversation lastMessage wasStreaming: false.
			self noteReadyForQuestion]
		ifTrue:
			[self updateStreamingConversation].