tests - futures
testFutureWhenWith

	| promise |
	promise := eventSource semanticFutureWhen: #anEvent: with: 9.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anEvent: with: 6.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anEvent: with: 9.
	self should: [promise isResolved].
	self assert: nil equals: promise value.