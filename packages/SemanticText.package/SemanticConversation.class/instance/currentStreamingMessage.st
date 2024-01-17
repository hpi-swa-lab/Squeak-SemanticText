accessing
currentStreamingMessage
	"Answer the current incomplete streaming message, if any."

	| message |
	self messages ifEmpty: [^ nil].
	message := self lastMessage.
	^ (message isStreaming and: [message isComplete not])
		ifTrue: [message]