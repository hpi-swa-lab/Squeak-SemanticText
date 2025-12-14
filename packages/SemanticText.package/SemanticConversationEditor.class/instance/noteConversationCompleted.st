updating - conversation
noteConversationCompleted 

	self stopWatchingConversation.
	self conversation removeActionsWithReceiver: self forEvent: #completed.
	
	Project current addDeferredUIMessage:
		[self containingWindow ifNotNil:
			[self changed: #isStreamingResponse.
			self hasPendingToolCalls
				ifTrue: [self noteReadyForToolResult]
				ifFalse: [self noteReadyForQuestion]]].