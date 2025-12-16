accessing - streaming
streamedAt: key ifPresent: aBlock

	^(self array at: (self scanForNonBlocking: key)) ifNotNil: [:assoc| aBlock value: assoc value]