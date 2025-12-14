streaming
beComplete

	self isComplete ifTrue: [^ self].
	
	complete := true.
	process := nil.
	self triggerEvent: #completed.