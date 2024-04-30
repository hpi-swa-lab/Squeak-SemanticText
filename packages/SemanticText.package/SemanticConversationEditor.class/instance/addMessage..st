actions
addMessage: aMessage

	(self anyTextPaneWithSelector: #text) ifNil: [^ self].
	
	^ self
		addDo: [self textFromMessages: {aMessage}]
		asPlaceholder: aMessage content isEmptyOrNil