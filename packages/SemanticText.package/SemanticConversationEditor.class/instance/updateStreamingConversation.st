updating - conversation
updateStreamingConversation

	self changed: #isStreamingResponse.
	(self conversation isStreaming and: [self conversation isComplete not]) ifFalse:
		[^ self noteConversationCompleted].
	
	self startWatchingConversation.
	self conversation when: #completed send: #noteConversationCompleted to: self.