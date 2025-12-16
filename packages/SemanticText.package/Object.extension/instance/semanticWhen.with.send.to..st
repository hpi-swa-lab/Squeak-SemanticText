*SemanticText-Model-*System-Object Events-accessing-registering
semanticWhen: anEventSelector with: argument send: aMessageSelector to: anObject
 
	self
		when: anEventSelector
		send: #semanticHandle:if:thenSend:
		to: anObject
		withArguments: {nil. argument. aMessageSelector}.