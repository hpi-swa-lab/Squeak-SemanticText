assistant
getAssistantReplies: number

	| messages |
	messages := self getAssistantMessages: number.
	messages do: [:message |
		message isStreaming ifTrue: [message waitUntilComplete]].
	^ messages collect: [:message | message content]