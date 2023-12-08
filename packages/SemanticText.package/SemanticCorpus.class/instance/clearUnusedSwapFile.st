swapping
clearUnusedSwapFile

	swapFileName ifNil: [^ self].
	documents ifNotNil:
		["swap file not needed"
		FileDirectory default deleteFileNamed: swapFileName].