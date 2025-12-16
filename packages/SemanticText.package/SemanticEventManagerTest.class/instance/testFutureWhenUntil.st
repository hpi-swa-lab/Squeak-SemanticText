tests - futures
testFutureWhenUntil

	| promise |
	promise := eventSource semanticFutureWhen: #anEvent: until: #anotherEvent:.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anotherEvent:.
	self should: [promise isRejected].
	self assert: nil equals: promise errorValue.