streaming
beComplete

	self isComplete ifTrue: [^ self].
	
	self streamingToolCalls ifNotEmpty: [:streamingToolCalls |
		streamingToolCalls do: [:toolCall | toolCall beComplete]].
	
	complete := true.
	process := nil.
	self triggerEvent: #completed.