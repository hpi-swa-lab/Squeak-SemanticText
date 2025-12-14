assistant
completeConversation
	"Completed the receiver with a new full assistant message retrieved from the model. If the assistant requests tool calls, these are automatically resolved and fed back to the model. No infinite loop protection!"

	^ self completeConversationWithConfig: nil