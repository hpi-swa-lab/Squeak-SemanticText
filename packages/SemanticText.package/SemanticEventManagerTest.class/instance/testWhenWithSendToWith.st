tests - events
testWhenWithSendToWith

	eventSource semanticWhen: #anEvent: with: 9 send: #getArg: to: self with: nil.
	
	succeeded := eventSource triggerEvent: #anEvent: withArguments: {6. -6}.
	self should: [succeeded isNil].
	
	succeeded := eventSource triggerEvent: #anEvent: withArguments: {9. -9}.
	self assert: -9 equals: succeeded.