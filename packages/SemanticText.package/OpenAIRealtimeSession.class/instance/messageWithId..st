private - conversation
messageWithId: id

	^ self conversation messages
		detect: [:message | message id = id]
		ifNone: [nil]