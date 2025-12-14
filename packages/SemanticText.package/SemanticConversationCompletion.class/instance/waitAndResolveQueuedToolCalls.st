tool calls
waitAndResolveQueuedToolCalls

	| toolCalls jobs hasNewToolMessages |
	toolCalls := self toolCallQueue.
	jobs := Array
		with:
			[[self waitForAssistantResponse]
				ensure: [self closeToolCallQueue]]
		with:
			[hasNewToolMessages := self processToolCalls: toolCalls].
	jobs semanticConcurrentCollect: [:ea | ea value].
	
	^ hasNewToolMessages