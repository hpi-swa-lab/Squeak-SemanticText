streaming
startStreaming

	self assert: self streamedArgumentsString = ''.
	self tool supportsStreamingArguments
		ifTrue: [self startArgumentsReader].