requests
getResponseWithConfig: aConfigOrNil

	| messagePromise |
	self assert: self isCurrentlyResponding not.
	messagePromise := self createResponseWithConfig: aConfigOrNil.
	^ messagePromise wait