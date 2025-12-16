streaming
waitUntilComplete

	| promise |
	promise := self semanticFutureWhen: #completed.
	self isComplete ifTrue: [^ self].
	promise wait.