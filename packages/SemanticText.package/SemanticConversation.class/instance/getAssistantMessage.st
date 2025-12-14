completing
getAssistantMessage
	"Retrieve a new assistant message from the model, append it to the receiver, and return it.
	NB: The new message might contained unresolved tool calls. To automatically resolve and feed them back to the model, send #getCompleteAssistantMessage instead."

	^ self getAssistantMessageWithConfig: nil