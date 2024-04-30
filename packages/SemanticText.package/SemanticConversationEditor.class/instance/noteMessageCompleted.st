updating
noteMessageCompleted

	(self hasPendingToolCallsFromUser: false) ifFalse:
		[^ self addUserMessage].
	
	"Handle new tool calls."
	self flag: #forLater. "support some this in a streaming conversation"
	(self isDisplayingRawConversation and: [self hasUnimplementedToolCalls]) ifTrue:
		[^ self].
	self resolveAllToolCallsFromUser: false.
	self shouldAutomaticallyCompleteToolMessages ifTrue:
		[(self future: 1) "hacked, otherwise text is not updated before???" completeAsIs].