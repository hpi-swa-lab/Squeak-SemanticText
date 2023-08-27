searching - private
concurrentlyDoAll: blocks
	"Evaluate all blocks concurrently with the active priority and wait until all evaluations are complete."

	| check processes sem |
	sem := Semaphore new.
	processes := nil.
	check := [[(processes notNil and: [processes allSatisfy: #isTerminated])
		ifTrue: [sem signal]]
			forkAt: Processor activePriority].
	
	processes := blocks collect: [:block |
		[block value. check value] forkAt: Processor activePriority].
	
	[sem wait] ifCurtailed:
		[processes do: [:process | process terminate]].