private
streamDoing: aBlock

	complete := false.
	process := [aBlock ensure: [self beComplete]]
		forkAt: Processor userBackgroundPriority.
	self triggerEvent: #streamingStarted.