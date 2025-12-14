tool calls
recordPendingToolCallsDuring: aBlock
	
	self startRecordPendingToolCalls.
	^ aBlock ensure:
		[self conversation removeActionsWithReceiver: self]