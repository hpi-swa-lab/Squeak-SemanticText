*SemanticText-enumerating
semanticConcurrentCollect: aBlock 

	| results states semaphores processes index |
	results := Dictionary new.
	states := Dictionary new.
	processes := Dictionary new.
	index := 0.
	semaphores := (self collect: [:ea |
		| myIndex semaphore |
		index := index + 1.
		myIndex := index.
		semaphore := Semaphore new.
		processes at: myIndex put:
			([[[results at: myIndex put: (aBlock cull: ea).
			states at: myIndex put: true]
				on: Error , Warning ", Halt" do: [:ex |
					states at: myIndex put: ex]]
						ensure: [semaphore signal]] forkAt: Processor activePriority).
		semaphore])
			contents.
	[semaphores do: [:semaphore | semaphore wait]]
		ifCurtailed: [processes do: #terminate].
	(states select: [:state | state ~~ true])
		ifNotEmpty: [:failedStates | self error: 'collect: failed for ' , failedStates size].
	^ results values