testing
isListeningContinuously

	^ listenerProcess notNil and: [listenerProcess isTerminated not]