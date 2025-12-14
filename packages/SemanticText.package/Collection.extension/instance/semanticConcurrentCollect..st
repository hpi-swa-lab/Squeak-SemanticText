*SemanticText-enumerating
semanticConcurrentCollect: aBlock 

	| results states semaphores processes |
	self size < 2 ifTrue: [^ self collect: aBlock].
	
	results := Array new: self size.
	states := Array new: self size.
	processes := Array new: self size.
	semaphores := self asArray withIndexCollect: [:ea :index |
		| semaphore |
		semaphore := Semaphore new.
		processes at: index put:
			([[[results at: index put: (aBlock cull: ea).
			states at: index put: true]
				on: Error , Warning ", Halt" do: [:ex |
					states at: index put: ex]]
						ensure: [semaphore signal]] forkAt: Processor activePriority).
		semaphore].
	[semaphores do: [:semaphore | semaphore wait]]
		ifCurtailed: [processes do: #terminate].
	(states select: [:state | state ~~ true])
		ifNotEmpty: [:failedStates | self error: 'collect: failed for ' , failedStates size].
	^ results as: self species