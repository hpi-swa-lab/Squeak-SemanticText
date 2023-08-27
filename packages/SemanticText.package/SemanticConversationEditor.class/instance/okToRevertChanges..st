updating
okToRevertChanges: aspect

	aspect = #editText: ifTrue:
		[Project current addDeferredUIMessage:
			[self addUserMessage]].
	
	^ true