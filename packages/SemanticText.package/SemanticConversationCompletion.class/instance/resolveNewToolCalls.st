tool calls
resolveNewToolCalls
	"Resolve all tool calls created from the current assistant message. Answer a boolean indicating whether any tool calls were resolved."

	^ self currentAssistantMessage isStreaming
		ifTrue:
			[self waitAndResolveQueuedToolCalls]
		ifFalse:
			[self processToolCalls: self currentAssistantMessage toolCalls]