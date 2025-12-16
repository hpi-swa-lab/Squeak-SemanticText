tests - futures
testFutureWhenWithArg

	| promise |
	promise := eventSource semanticFutureWhen: #anEvent: with: 9.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anEvent: withArguments: {6. -6}.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anEvent: withArguments: {9. -9}.
	self should: [promise isResolved].
	self assert: -9 equals: promise value.