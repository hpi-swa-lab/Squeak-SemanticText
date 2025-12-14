tool calls
startRecordPendingToolCalls

	self conversation
		when: #newToolCallReady
		send: #addNewToolCall:
		to: self.