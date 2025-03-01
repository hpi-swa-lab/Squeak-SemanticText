updating
updateStreamingMessage

	| streamingMessage |
	streamingMessage := self conversation currentStreamingMessage.
	self changed: #currentStreamingMessage.
	
	self changed: #text.
	streamingMessage ifNil: [^ self noteMessageCompleted: true].
	
	streamingMessage sendUpdatesFromTextModel: self selector: #text.
	streamingMessage
		when: #newSoundChunk
		send: #sayStreamingMessageAudio:at:
		to: self voiceAutomaton.
	streamingMessage when: #completed evaluate:
		[Project current addDeferredUIMessage:
			[self containingWindow ifNotNil:
				[self changed: #currentStreamingMessage.
				self noteMessageCompleted: true]]].
	
	self flag: #todo. "Auto-scrolling unless the user has started to scroll away would be great"