streaming
waitUntilComplete

	| semaphore |
	semaphore := Semaphore new.
	self when: #completed send: #signal to: semaphore. "NB: activeProcess must not be held weakly by whoever expects it to be completed. Here we remove it from the genuineProcess/quiescentProcessList of Processor and hold weakly on it by a WeakMessageSend, so an external strong reference on the process is crucial to avoid surprising GC of the process and starvation of its consumers."
	self isComplete ifTrue: [^ self].
	semaphore wait.