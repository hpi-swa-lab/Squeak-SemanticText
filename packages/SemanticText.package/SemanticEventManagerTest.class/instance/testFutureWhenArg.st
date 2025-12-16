tests - futures
testFutureWhenArg

	| promise |
	promise := eventSource semanticFutureWhen: #anEvent:.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anEvent: with: 9.
	self should: [promise isResolved].
	self assert: 9 equals: promise value.