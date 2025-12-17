tool calls
waitAndResolveQueuedToolCalls

	| toolCalls processProcess jobs hasNewToolMessages |
	toolCalls := self toolCallQueue.
	self flag: #todo. "refactor/rethink concurrency semantics here. perhaps waiting should stop when processing errors? what should be the general behavior of #semanticConcurrentCollect:?"
	processProcess := nil.
	jobs := Array
		with:
			[[[[self waitForAssistantResponse]
				on: Error do: [:ex | ex tag = #responseInterrupted ifFalse: [ex pass]]]
					ifCurtailed: [processProcess ifNotNil: [processProcess terminate]]]
						ensure: [self closeToolCallQueue]]
		with:
			[processProcess := Processor activeProcess.
			hasNewToolMessages := self processToolCalls: toolCalls].
	jobs semanticConcurrentCollect: [:ea | ea value].
	
	^ hasNewToolMessages