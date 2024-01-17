*SemanticText-enumerating
semanticConcurrentCollect: aBlock 

	| results states semaphores |
	results := Array new: self size.
	states := Array new: self size.
	semaphores := self withIndexCollect: [:ea :index |
		| semaphore |
		semaphore := Semaphore new.
		[[[results at: index put: (aBlock value: ea).
		states at: index put: true]
			on: Error , Warning , Halt do: [:ex |
				states at: index put: ex]]
					ensure: [semaphore signal]] fork.
		semaphore].
	semaphores do: [:semaphore | semaphore wait].
	(states select: [:state | state ~~ true])
		ifNotEmpty: [:failedStates | self error: 'collect: failed for ' , failedStates size].
	^ results as: self species