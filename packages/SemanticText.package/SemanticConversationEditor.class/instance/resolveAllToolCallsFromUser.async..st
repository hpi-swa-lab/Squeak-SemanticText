actions
resolveAllToolCallsFromUser: fromUser async: async

	"drop unused user message placeholder"
	self canDiscardEdits ifTrue:
		[self changed: #text].
	self text: self editText fromUser: fromUser.
	
	async
		ifFalse:
			[self beBusyDuring:
				[self conversation resolveAllToolCalls].
			
			self changed: #text]
		ifTrue:
			[| promise |
			promise := Promise new.
			[self conversation resolveAllToolCalls.
			Project current addDeferredUIMessage:
				[self conversation changed: #text.
				promise resolve]]
					forkAt: Processor userBackgroundPriority.
			^ promise].