completing
getAssistantReplies: number

	| responses |
	responses := self getAssistantMessages: number.
	responses do: [:message |
		message isStreaming ifTrue: [message waitUntilComplete]].
	^ responses collect: [:message | message content]