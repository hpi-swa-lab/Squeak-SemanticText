accessing - streaming
expectedArrayMaybeStreamAt: key

	^ self streamedAt: key ifAbsent:
		[| result |
		self at: key put: (result := SemanticBufferedChannel new).
		result]