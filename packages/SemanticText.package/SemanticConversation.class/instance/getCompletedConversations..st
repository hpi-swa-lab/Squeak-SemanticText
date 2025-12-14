assistant
getCompletedConversations: number
	"Return <number> copies of the receiver, each completed with a new full assistant message retrieved from the model. If the assistant requests tool calls, these are automatically resolved and fed back to the model. No infinite loop protection!"

	^ self getCompletedConversations: number config: nil