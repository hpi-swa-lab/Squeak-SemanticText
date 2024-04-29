instance creation
conversation: aConversation array: size role: role inBackgroundDo: streamBlock
	"Answer an array of <size> new instances and evaluate streamBlock to populate them in the background. Users can listen to the #newChunk and #completed events to react to updates."

	| messages process |
	messages := size timesCollect: [self conversation: aConversation role: role content: ''].
	process := [[streamBlock value: messages]
		ensure: [messages do: [:message | message beComplete]]]
			forkAt: Processor userBackgroundPriority.
	messages do: [:message |
		message process: process].
	^ messages