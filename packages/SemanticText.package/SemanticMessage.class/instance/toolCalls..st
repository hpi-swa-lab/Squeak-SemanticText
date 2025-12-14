accessing
toolCalls: aCollection

	toolCalls := aCollection.
	self toolCalls do: [:toolCall |
		toolCall conversation: self conversation].