assistant
getFinalAssistantReply
	"Convenience. No infinite loop protection!"

	[| message |
	message := self getAssistantMessage.
	message isStreaming ifTrue: [message waitUntilComplete].
	self hasPendingToolCalls ifFalse: [^ message content].
	self resolveAllToolCalls] repeat.