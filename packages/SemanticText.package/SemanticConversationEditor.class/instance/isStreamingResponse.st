accessing
isStreamingResponse

	^ self conversation isStreaming and: [self conversation isComplete not]