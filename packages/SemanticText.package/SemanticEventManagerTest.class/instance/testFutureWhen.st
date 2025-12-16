tests - futures
testFutureWhen

	| promise |
	promise := eventSource semanticFutureWhen: #anEvent:.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anEvent:.
	self should: [promise isResolved].
	self assert: nil equals: promise value.