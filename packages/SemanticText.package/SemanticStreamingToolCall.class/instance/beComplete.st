streaming
beComplete

	self isComplete ifTrue: [^ self].
	
	complete := true.
	self triggerEvent: #completed.