*SemanticText-enumerating
semanticConcurrentCollect: aBlock 

	| results states semaphores processes |
	self size < 2 ifTrue: [^ self collect: aBlock].
	
	results := Array new: self size.
	states := Array new: self size.
	processes := WeakSet new.
	semaphores := self asArray withIndexCollect: [:ea :index |
		| semaphore |
		semaphore := Semaphore new.
		processes add:
			[[[results at: index put: (aBlock cull: ea).
			states at: index put: true]
				on: Error , Warning , Halt do: [:ex |
					states at: index put: ex]]
						ensure: [semaphore signal]] fork.
		semaphore].
	[semaphores do: [:semaphore | semaphore wait]]
		ifCurtailed: [processes do: #terminate].
	(states select: [:state | state ~~ true])
		ifNotEmpty: [:failedStates | self error: 'collect: failed for ' , failedStates size].
	^ results as: self species