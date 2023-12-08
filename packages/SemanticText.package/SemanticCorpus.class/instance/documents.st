accessing
documents

	documents ifNil: [self swapInFromDisk].
	^ documents