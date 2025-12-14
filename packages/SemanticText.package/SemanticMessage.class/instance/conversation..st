accessing
conversation: aConversation

	conversation := aConversation.
	self toolCalls do: [:toolCall |
		toolCall conversation: self conversation].