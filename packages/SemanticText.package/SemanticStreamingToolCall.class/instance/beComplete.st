streaming
beComplete

	self isComplete ifTrue: [^ self].
	
	(self propertyValueRemoveAt: #argumentsReader ifAbsent: [nil])
		ifNotNil: [:gen |
			gen nextPut: nil. "for channel"
			gen semanticCloseProducer]
		ifNil:
			[super parseArguments: (self propertyValueRemoveAt: #streamedArgumentsString)].
	
	complete := true.
	self triggerEvent: #completed.
	self tool supportsStreamingArguments ifFalse:
		[self conversation triggerEvent: #newToolCallReady with: self].