streaming
beComplete

	self isComplete ifTrue: [^ self].
	
	complete := true.
	self triggerEvent: #completed.
	self conversation triggerEvent: #newToolCallReady with: self.