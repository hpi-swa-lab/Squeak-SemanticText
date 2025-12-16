testing
testString

	| generator result promise process expectedValue value |
	generator := Generator semanticOnConsumer: [:gen |
		self classToBeTested new
			onInitialResult: [:obj |
				result := obj];
			readFrom: gen].
	
	self assert: result isNil.
	
	generator nextPutAll: '{ '.
	self assert: (result isDictionary and: [result semanticIsStreamingJson]).
	self deny: result jsonIsComplete.
	self assert: (result streamedAt: #plonk) isNil.
	promise := Promise new.
	process := [promise fulfillWith: (result at: #plonk)] forkAt: Processor activePriority + 1.
	self assert: promise isPending.
	expectedValue := result expectedStringMaybeStreamAt: #plonk.
	self assert: expectedValue contents isEmpty.
	
	generator nextPutAll: '"plonk":"f'.
	self assert: promise isPending.
	self assert: expectedValue contents isEmpty.
	value := result streamedAt: #plonk.
	self assert: value isStream.
	self assert: value upToBlocking isEmpty.
	
	generator nextPutAll: 'o'.
	self assert: promise isPending.
	self assert: 'f' equals: expectedValue contents.
	
	generator nextPutAll: 'o"  '.
	self assert: promise isResolved.
	self assert: 'foo' equals: promise value.
	self assert: 'foo' equals: expectedValue contents.
	self assert: expectedValue atEnd.
	self assert: 'foo' equals: value contents.
	self assert: 'foo' equals: (result streamedAt: #plonk).
	self assert: 'foo' equals: (result expectedStringMaybeStreamAt: #plonk).
	self assert: 'foo' equals: (result at: #plonk).
	
	generator nextPutAll: '}'; semanticCloseProducer.
	self assert: result jsonIsComplete.