private
stopWatchingConversation

	conversationWatchingCounter ifNil: [conversationWatchingCounter := 0].
	(conversationWatchingCounter := conversationWatchingCounter - 1 clampLow: 0) > 0 ifTrue: [^ self].
	self conversation removeActionsWithReceiver: self forEvent: #newMessage.