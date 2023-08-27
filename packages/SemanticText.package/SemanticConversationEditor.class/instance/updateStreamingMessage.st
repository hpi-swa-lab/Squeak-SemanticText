updating
updateStreamingMessage

	| streamingMessage |
	streamingMessage := self conversation currentStreamingMessage.
	self changed: #currentStreamingMessage.
	
	streamingMessage ifNil: [^ self].
	
	self changed: #text.
	streamingMessage sendUpdatesFromTextModel: self selector: #text.
	streamingMessage when: #completed evaluate:
		[Project current addDeferredUIMessage:
			[self changed: #currentStreamingMessage.
			self addUserMessage]].
	
	self flag: #todo. "Auto-scrolling unless the user has started to scroll away would be great"