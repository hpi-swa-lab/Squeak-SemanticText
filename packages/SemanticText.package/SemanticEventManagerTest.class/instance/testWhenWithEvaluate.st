tests - events
testWhenWithEvaluate

	eventSource semanticWhen: #anEvent: with: 9 evaluate: [self heardEvent].
	
	eventSource triggerEvent: #anEvent: with: 6.
	self deny: [succeeded].
	
	eventSource triggerEvent: #anEvent: with: 9.
	self should: [succeeded].