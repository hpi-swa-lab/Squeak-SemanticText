accessing
toolMessage

	^ self conversation messages
		detect: [:ea | ea isToolMessage and: [ea toolCall == self]]
		ifNone: [nil]