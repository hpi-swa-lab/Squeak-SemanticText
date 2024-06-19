loop & scheduling
currentMessageName

	^ currentMessage isMessageSend
		ifTrue: [currentMessage selector]
		ifFalse: [currentMessage]