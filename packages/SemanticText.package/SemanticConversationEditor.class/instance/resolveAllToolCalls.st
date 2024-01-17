actions
resolveAllToolCalls

	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	self text: self editText.
	
	self beBusyDuring:
		[self conversation resolveAllToolCalls].
	
	self changed: #text.
	self addUserMessage.