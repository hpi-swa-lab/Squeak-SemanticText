toolbuilder
helpForCompleteCancel

	^ self isStreamingResponse
		ifFalse: [self helpForComplete]
		ifTrue: [self helpForCancel]