swapping
swapInFromDisk

	| corpus |
	corpus := self class fromFileNamed: swapFileName.
	documents := corpus documents.