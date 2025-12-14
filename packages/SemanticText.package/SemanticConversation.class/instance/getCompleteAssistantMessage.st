completing
getCompleteAssistantMessage
	"Convenience. No infinite loop protection!"

	self completeConversation.
	self isStreaming ifTrue: [self waitUntilComplete].
	^ self lastMessage