*SemanticText-Model-*System-Object Events-accessing-registering
semanticWhen: anEventSelector with: argument send: aMessageSelector to: anObject with: anArg
 
	self
		when: anEventSelector
		send: #semanticHandle:with:if:thenSend:
		to: anObject
		withArguments: {nil. anArg. argument. aMessageSelector}.