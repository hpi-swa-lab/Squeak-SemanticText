streaming
beComplete

	self isComplete ifTrue: [^ self].
	
	super parseArguments: (self propertyValueRemoveAt: #streamedArgumentsString).
	
	complete := true.
	self triggerEvent: #completed.
	self conversation triggerEvent: #newToolCallReady with: self.