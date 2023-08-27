instance creation
role: role inBackgroundDo: streamBlock
	"Answer a new instance and populate it in the background. Users can listen to the #newChunk and #completed events to react to updates."

	| message |
	message := self role: role content: ''.
	message process:
		([[streamBlock value: message]
			ensure: [message beComplete]]
				forkAt: Processor userBackgroundPriority).
	^ message