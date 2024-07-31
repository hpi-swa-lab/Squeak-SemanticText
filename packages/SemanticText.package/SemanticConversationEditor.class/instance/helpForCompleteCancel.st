toolbuilder
helpForCompleteCancel

	^ self canComplete
		ifTrue: [self helpForComplete]
		ifFalse: [self helpForCancel]