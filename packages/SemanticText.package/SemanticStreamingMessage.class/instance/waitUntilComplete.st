streaming
waitUntilComplete

	| semaphore |
	semaphore := Semaphore new.
	self when: #completed send: #signal to: semaphore.
	self isComplete ifTrue: [^ self].
	semaphore wait.