updating - conversation
noteStreamingMessageCompleted: aMessage

	Project current addDeferredUIMessage:
		[self containingWindow ifNotNil:
			[self noteMessageCompleted: aMessage wasStreaming: true]].