actions
addMessage: aMessage

	self containingWindow ifNil: [^ self].
	
	^ self addDo: [self textFromMessages: {aMessage}]