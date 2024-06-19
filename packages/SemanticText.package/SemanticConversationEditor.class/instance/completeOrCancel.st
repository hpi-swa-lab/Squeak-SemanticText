toolbuilder
completeOrCancel

	^ self canComplete
		ifTrue: [self complete]
		ifFalse: [self cancel]