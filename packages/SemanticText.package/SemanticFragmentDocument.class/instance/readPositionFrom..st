fileIn/Out
readPositionFrom: aStream

	aStream binary.
	start := aStream nextInt32.
	stop := aStream nextInt32.