loop & scheduling
processMessage: message

	^ message isMessageSend
		ifTrue: [message receiver: self; value]
		ifFalse: [message value: self]