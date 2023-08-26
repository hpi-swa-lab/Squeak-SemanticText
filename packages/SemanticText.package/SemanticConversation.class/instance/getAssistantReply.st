assistant
getAssistantReply

	| message |
	message := self getAssistantMessage.
	message isStreaming ifTrue: [message waitUntilComplete].
	^ message content