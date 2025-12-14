accessing - messages
lastMessage

	^ self messages atLast: 1 ifAbsent: [nil]