updating
windowIsClosing

	(Processor activeProcess environmentAt: #windowIsReopening ifAbsent: [false]) ifTrue:
		[^ self].
	
	self cancel.
	self voiceAutomaton stopVoice.
	self conversation realtimeSession ifNotNil: [self stopRealtimeSession].
	
	self conversation releaseForEventReceiver: self.
	self conversation toolCallResolver ifNotNil: [:resolver |
		resolver receiver == self ifTrue:
			[self uninstallToolCallResolver]].
	self voiceAutomaton removeActionsWithReceiver: self.
	
	^ super windowIsClosing