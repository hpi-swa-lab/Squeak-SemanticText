accessing - streaming
expectedStringMaybeStreamAt: key

	^ self streamedAt: key ifAbsent:
		[| result |
		self at: key put: (result := SemanticBufferedChannel newForString).
		result]