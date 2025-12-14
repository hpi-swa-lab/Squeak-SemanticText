accessing
pendingToolCalls

	^ self toolCalls select: [:ea | ea isPending]