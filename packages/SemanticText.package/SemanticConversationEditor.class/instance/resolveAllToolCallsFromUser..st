actions
resolveAllToolCallsFromUser: fromUser

	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	self text: self editText fromUser: fromUser.
	
	self beBusyDuring:
		[self conversation resolveAllToolCalls].
	
	self changed: #text.