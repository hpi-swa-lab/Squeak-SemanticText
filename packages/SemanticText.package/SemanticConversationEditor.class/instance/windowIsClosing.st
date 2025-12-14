updating
windowIsClosing

	self cancel.
	self voiceAutomaton stopVoice.
	
	self conversation releaseForEventReceiver: self.
	self conversation toolCallResolver ifNotNil: [:resolver |
		resolver receiver == self ifTrue:
			[self uninstallToolCallResolver]].
	self voiceAutomaton removeActionsWithReceiver: self.
	
	^ super windowIsClosing