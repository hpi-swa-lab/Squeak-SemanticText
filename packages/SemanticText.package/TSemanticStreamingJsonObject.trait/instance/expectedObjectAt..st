accessing - streaming
expectedObjectAt: key

	^ self streamedAt: key ifAbsent:
		[| result |
		self at: key put: (result := self species new).
		result]