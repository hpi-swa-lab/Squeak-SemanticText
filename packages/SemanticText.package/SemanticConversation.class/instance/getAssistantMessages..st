completing
getAssistantMessages: number
	"Retrieve <number> new assistant messages from the model, store each of them in a copy of the receiver, and return the new messages.
	NB: The new messages might contained unresolved tool calls. To automatically resolve and feed them back to the model, send #getCompleteAssistantMessages: instead."

	^ self getAssistantMessages: number config: nil