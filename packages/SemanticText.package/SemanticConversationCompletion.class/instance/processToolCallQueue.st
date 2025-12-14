tool calls
processToolCallQueue
	"Resolve all recorded tool calls. Answer a boolean indicating whether any tool calls were resolved."

	| toolMessages |
	self flag: #forLater. "introduce asynchronous tool calls that do not block current processing but entire completion and trigger new response once they resolve"
	
	toolMessages := (self effectiveConfig shouldResolveToolCallsInParallel ifNil: [false])
		ifFalse:
			[self toolCallQueue collect: [:toolCall |
				self flag: #workaround. "#-> wrapped because Stream>>#collect: skips nil values"
				toolCall -> (self conversation resolveToolCall: toolCall)]]
		ifTrue:
			[self toolCallQueue semanticConcurrentCollect: [:toolCall |
				self conversation resolveToolCall: toolCall]].
	^ (toolMessages collect: [:toolMessage | toolMessage value ifNil: [^ false]])
		contents notEmpty