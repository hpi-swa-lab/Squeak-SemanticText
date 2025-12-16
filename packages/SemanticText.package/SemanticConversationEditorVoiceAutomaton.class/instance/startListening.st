public requests
startListening

	self isListeningContinuously ifTrue:
		[self voiceState: #listening.
		^ self].
	
	self stopListening.
	self assureProcess.
	self shouldListenContinuously
		ifFalse: [self schedule: #listen]
		ifTrue: [self assureListenerProcess].