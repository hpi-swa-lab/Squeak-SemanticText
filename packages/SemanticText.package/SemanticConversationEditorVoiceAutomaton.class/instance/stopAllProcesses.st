loop & scheduling
stopAllProcesses

	self stopListenerProcess.
	self stopProcess.
	messages flush.