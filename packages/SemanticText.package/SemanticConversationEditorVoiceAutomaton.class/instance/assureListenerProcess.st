loop & scheduling
assureListenerProcess

	listenerProcess ifNotNil: [^ self].
	listenerProcess := [self listenContinuously]
		forkAt: Processor highIOPriority named:
			('{1} listener for {2}' format: {self className. self conversation}).