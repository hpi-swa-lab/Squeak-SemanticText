toolbuilder
completeOrCancel

	^ self isStreamingResponse
		ifFalse: [self complete]
		ifTrue: [self cancel]