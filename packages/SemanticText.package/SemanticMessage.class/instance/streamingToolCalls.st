accessing
streamingToolCalls

	^ self toolCalls select: [:toolCall | toolCall isStreaming]