initialize-release
releaseForEventReceiver: anObject

	self toolCalls do: [:toolCall |
		toolCall releaseForEventReceiver: anObject].