private
listenContinuously

	| accepted |
	self playInterrogativeSound.
	self voiceState: #listening.
	self triggerEvent: #continuousListeningStarted.
	[accepted := self recordSound notNil] ensure:
		[self triggerEvent: #continuousListeningStopped.
		self playAffirmationSound.
		self voiceState: nil].
	
	accepted ifFalse: [self stopRequested].