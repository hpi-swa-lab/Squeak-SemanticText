accessing - messages
pendingToolCalls

	^ self messages gather: [:message |
		message toolCalls select: [:toolCall | toolCall isPending]]