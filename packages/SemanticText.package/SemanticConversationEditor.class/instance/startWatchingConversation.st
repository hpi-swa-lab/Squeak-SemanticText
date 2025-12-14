private
startWatchingConversation

	conversationWatchingCounter ifNil: [conversationWatchingCounter := 0].
	(conversationWatchingCounter := conversationWatchingCounter + 1) > 1 ifTrue: [^ self].
	self conversation when: #newMessage send: #updateStreamingMessage: to: self.
	self installToolCallResolver.