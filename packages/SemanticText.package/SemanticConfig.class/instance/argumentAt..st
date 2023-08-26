accessing - generic
argumentAt: name

	^ self arguments at: name ifAbsent: [nil]