streaming
waitUntilComplete

	| semaphore |
	semaphore := Semaphore new.
	self when: #completed send: #signal to: semaphore.
	semaphore wait.