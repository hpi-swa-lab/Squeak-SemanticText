tests - futures
testFutureWhenUntilArg

	| promise |
	promise := eventSource semanticFutureWhen: #anEvent: until: #anotherEvent:.
	self should: [promise isPending].
	
	eventSource triggerEvent: #anotherEvent: with: 10.
	self should: [promise isRejected].
	self assert: 10 equals: promise errorValue.