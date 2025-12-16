private
basicScanForBlocking: anObject

	| index |
	self jsonIsComplete ifTrue: [^ super scanFor: anObject].
	
	index := super scanFor: anObject.
	(self array at: index) ifNotNil: [^ index].
	
	(Promise race:
		{self semanticFutureWhen: #keyAdded with: anObject.
		self semanticFutureWhen: #completed until: #cancelled}) wait.
	^ self basicScanForBlocking: anObject