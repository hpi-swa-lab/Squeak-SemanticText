tools
resolveAllToolCallsWithConfig: aConfigOrNil
	"Resolve all pending tool calls from the receiver. Answer a boolean indicating whether any tool calls were resolved."

	^ (SemanticConversationCompletion newFor: self config: aConfigOrNil)
		processToolCalls: self pendingToolCalls