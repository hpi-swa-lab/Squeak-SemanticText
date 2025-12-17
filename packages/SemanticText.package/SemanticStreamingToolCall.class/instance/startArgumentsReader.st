streaming
startArgumentsReader

	| channel reader readPromise |
	channel := SemanticBufferedChannel new. "buffering needed for number parsing"
	readPromise := Promise new.
	reader :=
		[readPromise fulfillWith:
			[| char |
			SemanticStreamingJson new
				onInitialResult: [:obj |
					self arguments: obj.
					self conversation triggerEvent: #newToolCallReady with: self];
				readOrderedFrom: channel.
			[char := channel next] whileNotNil: [self assert: char isSeparator]]]
				forkAt: Processor activePriority.
	self propertyValueAt: #argumentsReader put:
		(Generator semanticOnConsumer: [:gen |
			channel nextPutAll: gen; close.
			readPromise wait]).