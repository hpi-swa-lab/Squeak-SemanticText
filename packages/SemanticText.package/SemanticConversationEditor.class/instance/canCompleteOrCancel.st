toolbuilder
canCompleteOrCancel

	^ self isStreamingResponse
		ifFalse: [self canComplete]
		ifTrue: [true]