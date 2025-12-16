tests - events
testWhenWithEvaluateWith

	eventSource semanticWhen: #anEvent: with: 9 evaluate: [:arg1 | eventListener add: arg1].
	
	eventSource triggerEvent: #anEvent: withArguments: {6. -6}.
	self should: [eventListener isEmpty].
	
	eventSource triggerEvent: #anEvent: withArguments: {9. -9}.
	self should: [eventListener includes: -9].