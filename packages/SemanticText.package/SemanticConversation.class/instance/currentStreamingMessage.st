accessing - messages
currentStreamingMessage
	"Answer the current incomplete streaming message, if any."

	| message |
	message := self lastMessage ifNil: [^ nil].
	^ (message isStreaming and: [message isComplete not])
		ifTrue: [message]